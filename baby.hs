doubleMe :: Double -> Double
doubleMe x = 2.0*x
doubleUs :: Double -> Double -> Double
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumbers :: Double -> Double
doubleSmallNumbers x = if x > 100 then x else doubleMe x

lucky :: (Integral a) => a -> String
lucky 7 = "Gg"
lucky x = "Sorry"

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' 0 x = []
replicate' n x = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n (x:xs)
	| n <= 0 	= []
	| otherwise = x:take' (n-1) xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' e = foldr (\x acc -> if x == e then True else (acc || False)) False

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
	let smallerSorted = quicksort [a | a <- xs, a <= x];
		biggerSorted = quicksort [a | a <- xs, a > x]
	in smallerSorted ++ [x] ++ biggerSorted

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)