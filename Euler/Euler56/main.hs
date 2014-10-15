module Main where

import           Control.Applicative
import           Data.Char           (digitToInt)
import           System.IO           (print)

main = print $ maximum $ map sumOfDigits gogol

gogol = (^) <$> [1..100] <*> [1..100]

sumOfDigits = sum . map digitToInt . show
