module Main where

import           System.IO (print)

main = print solution

fact 0 = 1
fact n = product [1..n]

combination n k = floor $ (fact n) / ((fact k) * (fact (n-k)))

solution = length $ filter (>1000000) [combination n k | n <- [1..100], k <- [1..n]]

