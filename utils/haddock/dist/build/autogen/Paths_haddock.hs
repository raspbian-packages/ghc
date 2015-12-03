module Paths_haddock (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [2,16,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/usr/local/bin"
libdir     = "/usr/local/lib/x86_64-linux-ghc-7.10.3/haddock-2.16.1-KTPBoHTybjFCvtPzxbgYC3"
datadir    = "/usr/local/share/x86_64-linux-ghc-7.10.3/haddock-2.16.1"
libexecdir = "/usr/local/libexec"
sysconfdir = "/usr/local/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haddock_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haddock_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haddock_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haddock_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haddock_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
