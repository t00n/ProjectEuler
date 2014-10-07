import Data.List
import Data.Numbers.Primes


getGroup = group . primeFactors

fusion xs [] = [foldr (\x acc -> acc + (head x)^(length x)) 0 xs]
fusion [] xs = [foldr (\x acc -> acc + (head x)^(length x)) 0 xs]
fusion (x:xs) (y:ys)
	| head x == head y = ((head x)^(max (length x) (length y))) : fusion xs ys
	| head x > head y = ((head y)^(length y)) : fusion (x:xs) ys
	| otherwise = ((head x)^(length x)) : fusion xs (y:ys)

ppcm x y = product $ fusion (getGroup x) (getGroup y)