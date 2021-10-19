module Main where

import GHC.Stack
import System.Directory
import Data.Maybe (fromJust)

-- get stack trace up on exception run as follows:
-- @
-- stack run --profile  --resolver=ghc-9.0.1 -- +RTS  -xc
-- @
main :: HasCallStack => IO ()
main = do
  _ <- myDo2 "/z"
  print f1


myDo2:: HasCallStack => FilePath -> IO [FilePath]
myDo2 x = do
  putStrLn "ppp"
  r <- myDo x
  putStrLn "www"
  pure r


myDo :: HasCallStack => FilePath -> IO [FilePath]
myDo x = do
  putStrLn "DDD"
  r <- getDirectoryContents x
  putStrLn "XXX"
  pure r

f1 :: Int
f1 = f2

f2 :: Int
f2 = f3

-- HsQualTy
f3 :: Int
f3 = f4 0

-- HsQualTy
f4 :: Show a => a -> Int
f4 n = f5 (show n) 0

-- HsFunTy
f5 :: String -> Int -> Int
f5 _ _ = head f6

-- HsListTy
f6 :: [Int]
f6 = [fst f7]

-- HsTupleTy
f7 :: (Int, Int)
f7 = (fromJust f8, fromJust f8)

-- HsAppTy
f8 :: Maybe Int
f8 = Just f9

f9 :: Int
f9 = f10
  where
    f10 :: Int
    f10 = fError

-- HsTyVar
fError :: Int
fError = error "fError"
