{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_containers (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,6,4,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/usr/local/bin"
libdir     = "/usr/local/lib/x86_64-linux-ghc-9.0.2/containers-0.6.4.1"
dynlibdir  = "/usr/local/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/usr/local/share/x86_64-linux-ghc-9.0.2/containers-0.6.4.1"
libexecdir = "/usr/local/libexec/x86_64-linux-ghc-9.0.2/containers-0.6.4.1"
sysconfdir = "/usr/local/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "containers_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "containers_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "containers_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "containers_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "containers_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "containers_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
