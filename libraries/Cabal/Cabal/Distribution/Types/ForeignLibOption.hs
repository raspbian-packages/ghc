{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}

module Distribution.Types.ForeignLibOption(
    ForeignLibOption(..)
) where

import Prelude ()
import Distribution.Compat.Prelude

import Text.PrettyPrint
import qualified Distribution.Compat.ReadP as Parse
import Distribution.Text

data ForeignLibOption =
     -- | Merge in all dependent libraries (i.e., use
     -- @ghc -shared -static@ rather than just record
     -- the dependencies, ala @ghc -shared -dynamic@).
     -- This option is compulsory on Windows and unsupported
     -- on other platforms.
     ForeignLibStandalone
    deriving (Generic, Show, Read, Eq, Typeable, Data)

instance Text ForeignLibOption where
  disp ForeignLibStandalone = text "standalone"

  parse = Parse.choice [
      do _ <- Parse.string "standalone" ; return ForeignLibStandalone
    ]

instance Binary ForeignLibOption

