import Data.List
import Data.Numbers.Primes
import System.IO

sum' n = n*(n+1) `div`2

nbFactors n = map (\x -> length x + 1) $ group $ primeFactors n

triangleNbs = head [n | n <- [5000000..], product (nbFactors n) > 500]

main = putStrLn $ show triangleNbs