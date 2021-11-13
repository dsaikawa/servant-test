{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_servant_test (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/bin"
libdir     = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/lib/x86_64-linux-ghc-8.10.7/servant-test-0.1.0.0-HhT54P5lSMDD07wIN37W5W-servant-test-exe"
dynlibdir  = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/share/x86_64-linux-ghc-8.10.7/servant-test-0.1.0.0"
libexecdir = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/libexec/x86_64-linux-ghc-8.10.7/servant-test-0.1.0.0"
sysconfdir = "/mnt/c/Users/systemi/Documents/Haskell/servant-test/.stack-work/install/x86_64-linux-tinfo6/b80af0a4b8881101e02602c8406e2312ceb91c62df6e0bd1c03cf2f57eca5f63/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "servant_test_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "servant_test_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "servant_test_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "servant_test_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "servant_test_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "servant_test_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
