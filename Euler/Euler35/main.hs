module Main where

import           Data.Numbers.Primes (isPrime, primes)
import           System.IO           (print)

main = print ooohYouTouchMySolution

cyclic :: Int -> [Int]
cyclic n = (map read . cyclicTake l . take (2*l-1) . cycle) s
                where s = show n
                      l = length s
                      cyclicTake times xs = if times == length xs
                                            then [xs]
                                            else take times xs : cyclicTake times (tail xs)


isCircularPrime = and . map isPrime . cyclic

ooohYouTouchMySolution = length $ filter isCircularPrime $ takeWhile (<1000000) primes
-- > https://www.youtube.com/watch?v=z13qnzUQwuI < --

