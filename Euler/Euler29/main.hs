module Main where

import           Control.Applicative
import           Data.List           (group, sort)
import           System.IO

main = print $ (length . group . sort) $ (^) <$> [2..100] <*> [2..100]

