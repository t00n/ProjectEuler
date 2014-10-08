module Main where

import           Control.Applicative
import           Data.List           (group, sort)
import           System.IO

filterDistincts = map head . group . sort

allThoseShit = (^) <$> [2..100] <*> [2..100]

main = print $ length $ filterDistincts allThoseShit

