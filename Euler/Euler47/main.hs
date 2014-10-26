module Main where

import           Data.List           (group)
import           Data.Numbers.Primes (primeFactors)
import           System.IO           (print)

main = print $ findMeAnAnswerMastaaaaaaa 1

findMeAnAnswerMastaaaaaaa n = if and $ map (\a -> isitisit a == 4) [n..n+3]
                              then n
                              else findMeAnAnswerMastaaaaaaa (n+1)
                                where isitisit = length . group . primeFactors
