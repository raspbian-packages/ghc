module Rules.Configure (configureRules) where

import Base
import Builder
import CommandLine
import Context
import Packages
import Target
import Utilities

import qualified System.Info.Extra as System

-- | Files generated by running the @configure@ script.
configureResults :: [FilePath]
configureResults =
    [ configFile
    , configH
    , "compiler/ghc.cabal"
    , "rts/rts.cabal"
    , "ghc/ghc-bin.cabal"
    , "utils/iserv/iserv.cabal"
    , "utils/iserv-proxy/iserv-proxy.cabal"
    , "utils/remote-iserv/remote-iserv.cabal"
    , "utils/ghc-pkg/ghc-pkg.cabal"
    , "utils/runghc/runghc.cabal"
    , "utils/gen-dll/gen-dll.cabal"
    , "libraries/ghc-boot/ghc-boot.cabal"
    , "libraries/ghc-boot-th/ghc-boot-th.cabal"
    , "libraries/ghci/ghci.cabal"
    , "libraries/ghc-heap/ghc-heap.cabal"
    , "libraries/libiserv/libiserv.cabal"
    , "libraries/template-haskell/template-haskell.cabal"
    , "docs/users_guide/ghc_config.py"
    , "docs/index.html"
    , "libraries/prologue.txt"
    , "distrib/configure.ac"
    ]

configureRules :: Rules ()
configureRules = do
    configureResults &%> \outs -> do
        -- Do not cache the results. The true dependencies of the configure
        -- script are not tracked. This includes e.g. the ghc source path.
        historyDisable

        skip <- not <$> cmdConfigure
        if skip
        then unlessM (doesFileExist configFile) $
            error $ "Configuration file " ++ configFile ++ " is missing.\n"
                ++ "Run the configure script manually or let Hadrian run it "
                ++ "automatically by passing the flag --configure."
        else do
            -- We cannot use windowsHost here due to a cyclic dependency.
            when windowsHost $ do
                putBuild "| Checking for Windows tarballs..."
                pythonPath <- builderPath Python
                quietly $ cmd [pythonPath, "mk/get-win32-tarballs.py", "download", System.arch]
            let srcs    = map (<.> "in") outs
                context = vanillaContext Stage0 compiler
            need srcs
            build $ target context (Configure ".") srcs outs
            -- TODO: This is fragile: we should remove this from behind the
            -- @--configure@ flag and add a proper dependency tracking.
            -- We need to copy the directory with unpacked Windows tarball to
            -- the build directory, so that the built GHC has access to it.
            -- See https://github.com/snowleopard/hadrian/issues/564.
            when windowsHost $ do
                root <- buildRoot
                copyDirectory "inplace/mingw" (root -/- "mingw")
                mingwFiles <- liftIO $ getDirectoryFilesIO "." [root -/- "mingw/**"]
                produces mingwFiles

    ["configure", configH <.> "in"] &%> \_ -> do
        skip <- not <$> cmdConfigure
        if skip
        then unlessM (doesFileExist "configure") $
            error $ "The configure script is missing.\nRun the boot script "
                ++ "manually let Hadrian run it automatically by passing the "
                ++ "flag --configure."
        else do
            need ["configure.ac"]
            putBuild "| Running boot..."
            verbosity <- getVerbosity
            quietly $ cmd [EchoStdout (verbosity >= Loud)] "python3 boot --hadrian"
