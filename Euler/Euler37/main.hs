module Main where

import System.IO (print)
import Data.Numbers.Primes (isPrime, primes)
import Data.List (inits, tails)

main = print thatWasEasy

suchPrimesThatsAwesome x = let trueInits = tail . inits . show
                               trueTails = init . tails . show
                               lefttoright = (and . map (isPrime . read) . trueTails) x
                               righttoleft = (and . map (isPrime . read) . trueInits) x
                           in lefttoright && righttoleft

thatWasEasy = sum $ take 11 $ filter suchPrimesThatsAwesome $ dropWhile (<10) primes
