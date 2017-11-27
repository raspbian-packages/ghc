{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Distribution.Types.Module
  ( Module(..)
  ) where

import Prelude ()
import Distribution.Compat.Prelude

import qualified Distribution.Compat.ReadP as Parse
import qualified Text.PrettyPrint as Disp
import Distribution.Text
import Distribution.Types.UnitId
import Distribution.ModuleName

-- | A module identity uniquely identifies a Haskell module by
-- qualifying a 'ModuleName' with the 'UnitId' which defined
-- it.  This type distinguishes between two packages
-- which provide a module with the same name, or a module
-- from the same package compiled with different dependencies.
-- There are a few cases where Cabal needs to know about
-- module identities, e.g., when writing out reexported modules in
-- the 'InstalledPackageInfo'.
data Module =
      Module DefUnitId ModuleName
    deriving (Generic, Read, Show, Eq, Ord, Typeable, Data)

instance Binary Module

instance Text Module where
    disp (Module uid mod_name) =
        disp uid <<>> Disp.text ":" <<>> disp mod_name
    parse = do
        uid <- parse
        _ <- Parse.char ':'
        mod_name <- parse
        return (Module uid mod_name)

instance NFData Module where
    rnf (Module uid mod_name) = rnf uid `seq` rnf mod_name
