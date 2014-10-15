module Main where

import           Control.Applicative
import           Data.List           (sort)
import           System.IO           (print)

main = print $ answer 1

answer n = if sameDigits n
            then n
            else answer (n+1)

sameDigits :: Int -> Bool
sameDigits n = and $ map (((==) . sort . show) n) $ map (sort . show) ((*) <$> [n] <*> [2..6])
