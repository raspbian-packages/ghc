module Main (main) where

import EffBench
import Control.Exception.Base

n :: Int
n = 10000000

main = do

  putStrLn "CSD"
  evaluate $ (cstimes :: Int -> (Int -> ((), Int))) n (0 :: Int)

