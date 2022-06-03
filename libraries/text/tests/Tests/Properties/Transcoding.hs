-- | Tests for encoding and decoding

{-# LANGUAGE OverloadedStrings, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-enable-rewrite-rules -fno-warn-missing-signatures -fno-warn-unused-imports -fno-warn-deprecations #-}
module Tests.Properties.Transcoding
    ( testTranscoding
    ) where

import Control.Applicative ((<$>), (<*>))
import Data.Bits ((.&.))
import Data.Char (chr, ord)
import Data.Text.Encoding.Error (UnicodeException)
import Data.Text.Internal.Encoding.Utf8 (ord2, ord3, ord4)
import Test.QuickCheck hiding ((.&.))
import Test.QuickCheck.Property (Property(..))
import Test.QuickCheck.Monadic
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.QuickCheck (testProperty)
import Tests.QuickCheckUtils
import Text.Show.Functions ()
import qualified Control.Exception as Exception
import qualified Data.Bits as Bits (shiftL, shiftR)
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import qualified Data.Text.Encoding as E
import qualified Data.Text.Encoding.Error as E
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as EL

-- Note: this silently truncates code-points > 255 to 8-bit due to 'B.pack'
encodeL1 :: T.Text -> B.ByteString
encodeL1 = B.pack . map (fromIntegral . fromEnum) . T.unpack
encodeLazyL1 :: TL.Text -> BL.ByteString
encodeLazyL1 = BL.fromChunks . map encodeL1 . TL.toChunks

t_ascii t    = E.decodeASCII (E.encodeUtf8 a) === a
    where a  = T.map (\c -> chr (ord c `mod` 128)) t
tl_ascii t   = EL.decodeASCII (EL.encodeUtf8 a) === a
    where a  = TL.map (\c -> chr (ord c `mod` 128)) t
t_latin1 t   = E.decodeLatin1 (encodeL1 a) === a
    where a  = T.map (\c -> chr (ord c `mod` 256)) t
tl_latin1 t  = EL.decodeLatin1 (encodeLazyL1 a) === a
    where a  = TL.map (\c -> chr (ord c `mod` 256)) t
t_utf8       = forAll genUnicode $ (E.decodeUtf8 . E.encodeUtf8) `eq` id
t_utf8'      = forAll genUnicode $ (E.decodeUtf8' . E.encodeUtf8) `eq` (id . Right)
tl_utf8      = forAll genUnicode $ (EL.decodeUtf8 . EL.encodeUtf8) `eq` id
tl_utf8'     = forAll genUnicode $ (EL.decodeUtf8' . EL.encodeUtf8) `eq` (id . Right)
t_utf16LE    = forAll genUnicode $ (E.decodeUtf16LE . E.encodeUtf16LE) `eq` id
tl_utf16LE   = forAll genUnicode $ (EL.decodeUtf16LE . EL.encodeUtf16LE) `eq` id
t_utf16BE    = forAll genUnicode $ (E.decodeUtf16BE . E.encodeUtf16BE) `eq` id
tl_utf16BE   = forAll genUnicode $ (EL.decodeUtf16BE . EL.encodeUtf16BE) `eq` id
t_utf32LE    = forAll genUnicode $ (E.decodeUtf32LE . E.encodeUtf32LE) `eq` id
tl_utf32LE   = forAll genUnicode $ (EL.decodeUtf32LE . EL.encodeUtf32LE) `eq` id
t_utf32BE    = forAll genUnicode $ (E.decodeUtf32BE . E.encodeUtf32BE) `eq` id
tl_utf32BE   = forAll genUnicode $ (EL.decodeUtf32BE . EL.encodeUtf32BE) `eq` id

t_utf8_incr = forAll genUnicode $ \s (Positive n) -> (recode n `eq` id) s
    where recode n = T.concat . map fst . feedChunksOf n E.streamDecodeUtf8 .
                     E.encodeUtf8

feedChunksOf :: Int -> (B.ByteString -> E.Decoding) -> B.ByteString
             -> [(T.Text, B.ByteString)]
feedChunksOf n f bs
  | B.null bs  = []
  | otherwise  = let (x,y) = B.splitAt n bs
                     E.Some t b f' = f x
                 in (t,b) : feedChunksOf n f' y

t_utf8_undecoded = forAll genUnicode $ \t ->
  let b = E.encodeUtf8 t
      ls = concatMap (leftover . E.encodeUtf8 . T.singleton) . T.unpack $ t
      leftover = (++ [B.empty]) . init . tail . B.inits
  in (map snd . feedChunksOf 1 E.streamDecodeUtf8) b === ls

data Badness = Solo | Leading | Trailing
             deriving (Eq, Show)

instance Arbitrary Badness where
    arbitrary = elements [Solo, Leading, Trailing]

t_utf8_err :: Badness -> Maybe DecodeErr -> Property
t_utf8_err bad mde = do
  let gen = case bad of
        Solo     -> genInvalidUTF8
        Leading  -> B.append <$> genInvalidUTF8 <*> genUTF8
        Trailing -> B.append <$> genUTF8 <*> genInvalidUTF8
      genUTF8 = E.encodeUtf8 <$> genUnicode
  forAll gen $ \bs -> MkProperty $
    case mde of
      -- generate an invalid character
      Nothing -> do
        c <- choose ('\x10000', maxBound)
        let onErr _ _ = Just c
        unProperty . monadicIO $ do
        l <- run $ let len = T.length (E.decodeUtf8With onErr bs)
                   in (len `seq` return (Right len)) `Exception.catch`
                      (\(e::Exception.SomeException) -> return (Left e))
        assert $ case l of
          Left err ->
            "non-BMP replacement characters not supported" `T.isInfixOf` T.pack (show err)
          Right _  -> False

      -- generate a valid onErr
      Just de -> do
        onErr <- genDecodeErr de
        unProperty . monadicIO $ do
        l <- run $ let len = T.length (E.decodeUtf8With onErr bs)
                   in (len `seq` return (Right len)) `Exception.catch`
                      (\(e::UnicodeException) -> return (Left e))
        assert $ case l of
          Left err -> length (show err) >= 0
          Right _  -> de /= Strict

t_utf8_err' :: B.ByteString -> Property
t_utf8_err' bs = monadicIO . assert $ case E.decodeUtf8' bs of
                                        Left err -> length (show err) >= 0
                                        Right t  -> T.length t >= 0

genInvalidUTF8 :: Gen B.ByteString
genInvalidUTF8 = B.pack <$> oneof [
    -- invalid leading byte of a 2-byte sequence
    (:) <$> choose (0xC0, 0xC1) <*> upTo 1 contByte
    -- invalid leading byte of a 4-byte sequence
  , (:) <$> choose (0xF5, 0xFF) <*> upTo 3 contByte
    -- 4-byte sequence greater than U+10FFFF
  , do k <- choose (0x11, 0x13)
       let w0 = 0xF0 + (k `Bits.shiftR` 2)
           w1 = 0x80 + ((k .&. 3) `Bits.shiftL` 4)
       ([w0,w1]++) <$> vectorOf 2 contByte
    -- continuation bytes without a start byte
  , listOf1 contByte
    -- short 2-byte sequence
  , (:[]) <$> choose (0xC2, 0xDF)
    -- short 3-byte sequence
  , (:) <$> choose (0xE0, 0xEF) <*> upTo 1 contByte
    -- short 4-byte sequence
  , (:) <$> choose (0xF0, 0xF4) <*> upTo 2 contByte
    -- overlong encoding
  , do k <- choose (0,0xFFFF)
       let c = chr k
       case k of
         _ | k < 0x80   -> oneof [ let (w,x)     = ord2 c in return [w,x]
                                 , let (w,x,y)   = ord3 c in return [w,x,y]
                                 , let (w,x,y,z) = ord4 c in return [w,x,y,z] ]
           | k < 0x7FF  -> oneof [ let (w,x,y)   = ord3 c in return [w,x,y]
                                 , let (w,x,y,z) = ord4 c in return [w,x,y,z] ]
           | otherwise  ->         let (w,x,y,z) = ord4 c in return [w,x,y,z]
  ]
  where
    contByte = (0x80 +) <$> choose (0, 0x3f)
    upTo n gen = do
      k <- choose (0,n)
      vectorOf k gen

decodeLL :: BL.ByteString -> TL.Text
decodeLL = EL.decodeUtf8With E.lenientDecode

decodeL :: B.ByteString -> T.Text
decodeL = E.decodeUtf8With E.lenientDecode

-- The lenient decoding of lazy bytestrings should not depend on how they are chunked,
-- and it should behave the same as decoding of strict bytestrings.
t_decode_utf8_lenient :: Property
t_decode_utf8_lenient = forAllShrinkShow arbitrary shrink (show . BL.toChunks) $ \bs ->
    decodeLL bs === (TL.fromStrict . decodeL . B.concat . BL.toChunks) bs

-- See http://unicode.org/faq/utf_bom.html#gen8
-- A sequence such as <110xxxxx2 0xxxxxxx2> is illegal ...
-- When faced with this illegal byte sequence ... a UTF-8 conformant process
-- must treat the first byte 110xxxxx2 as an illegal termination error
-- (e.g. filter it out or replace by 0xFFFD) ...
-- ... and continue processing at the second byte 0xxxxxxx2
t_decode_with_error2 =
  E.decodeUtf8With (\_ _ -> Just 'x') (B.pack [0xC2, 97]) === "xa"
t_decode_with_error3 =
  E.decodeUtf8With (\_ _ -> Just 'x') (B.pack [0xE0, 97, 97]) === "xaa"
t_decode_with_error4 =
  E.decodeUtf8With (\_ _ -> Just 'x') (B.pack [0xF0, 97, 97, 97]) === "xaaa"

t_decode_with_error2' =
  case E.streamDecodeUtf8With (\_ _ -> Just 'x') (B.pack [0xC2, 97]) of
    E.Some x _ _ -> x === "xa"
t_decode_with_error3' =
  case E.streamDecodeUtf8With (\_ _ -> Just 'x') (B.pack [0xC2, 97, 97]) of
    E.Some x _ _ -> x === "xaa"
t_decode_with_error4' =
  case E.streamDecodeUtf8With (\_ _ -> Just 'x') (B.pack [0xC2, 97, 97, 97]) of
    E.Some x _ _ -> x === "xaaa"

t_infix_concat bs1 text bs2 =
  forAll (genDecodeErr Replace) $ \onErr ->
  text `T.isInfixOf`
    E.decodeUtf8With onErr (B.concat [bs1, E.encodeUtf8 text, bs2])

testTranscoding :: TestTree
testTranscoding =
  testGroup "transcoding" [
    testProperty "t_ascii" t_ascii,
    testProperty "tl_ascii" tl_ascii,
    testProperty "t_latin1" t_latin1,
    testProperty "tl_latin1" tl_latin1,
    testProperty "t_utf8" t_utf8,
    testProperty "t_utf8'" t_utf8',
    testProperty "t_utf8_incr" t_utf8_incr,
    testProperty "t_utf8_undecoded" t_utf8_undecoded,
    testProperty "tl_utf8" tl_utf8,
    testProperty "tl_utf8'" tl_utf8',
    testProperty "t_utf16LE" t_utf16LE,
    testProperty "tl_utf16LE" tl_utf16LE,
    testProperty "t_utf16BE" t_utf16BE,
    testProperty "tl_utf16BE" tl_utf16BE,
    testProperty "t_utf32LE" t_utf32LE,
    testProperty "tl_utf32LE" tl_utf32LE,
    testProperty "t_utf32BE" t_utf32BE,
    testProperty "tl_utf32BE" tl_utf32BE,
    testGroup "errors" [
      testProperty "t_utf8_err" t_utf8_err,
      testProperty "t_utf8_err'" t_utf8_err'
    ],
    testGroup "error recovery" [
      testProperty "t_decode_utf8_lenient" t_decode_utf8_lenient,
      testProperty "t_decode_with_error2" t_decode_with_error2,
      testProperty "t_decode_with_error3" t_decode_with_error3,
      testProperty "t_decode_with_error4" t_decode_with_error4,
      testProperty "t_decode_with_error2'" t_decode_with_error2',
      testProperty "t_decode_with_error3'" t_decode_with_error3',
      testProperty "t_decode_with_error4'" t_decode_with_error4',
      testProperty "t_infix_concat" t_infix_concat
    ]
  ]
