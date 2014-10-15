module Main where

import           Data.List           (sort)
import           Data.Numbers.Primes (isPrime)
import           System.IO           (print)

main = print $ head $ map (\(a,b,c) -> show a ++ show b ++ show c) andTheAnswerIs

andTheAnswerIs = [(a, a + 3330, a + 6660)  | a <- [1000..7000], and $ map isPrime [a, a + 3330, a + 6660], a + 6660 < 10000, thisIsDumb a == thisIsDumb (a + 3330), thisIsDumb a == thisIsDumb (a + 6660), a /= 1487]
                where thisIsDumb = sort . show

