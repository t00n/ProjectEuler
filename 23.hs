import Data.Numbers.Primes
import Data.List


primeFactors' = map (\all@(x:xs) -> (x, (length all))) . group . primeFactors

sumOfFactors :: (Integral a, Eq a) => (a, a) -> a
sumOfFactors (_, 0) = 1
sumOfFactors (x, y) = (x^y) + (sumOfFactors (x, (y - 1)))

sumOfProperDivisors n = (product $ map sumOfFactors (primeFactors' n)) - n

isAbundant n = (sumOfProperDivisors n) > n
isNotAbundant = not . isAbundant

abundants = [x | x <- [12..14062], isAbundant x]
