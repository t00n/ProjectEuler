import Data.Map as M
import Data.List

--me
freqTable :: (Ord a, Num b) => [a] -> Map a b
freqTable [] = M.empty
freqTable (x:xs) = M.insertWith (+) x 1 (freqTable xs)

--assistant
freqTable' :: (Ord a, Num b) => Map a b -> [a] -> Map a b
freqTable' mp [] = M.empty
freqTable' mp (x:xs) = M.insertWith (+) x 1 (freqTable' mp xs)

--assistant
freqTable'' :: (Ord a, Num b) => Map a b -> [a] -> Map a b
-- implicit xs argument
freqTable'' xs = Prelude.foldr (\x mp -> insertWith (+) x 1 mp) M.empty

--me
freqTable''' :: (Ord a, Num b) => [a] -> Map a b
-- implicit xs argument
freqTable''' = Prelude.foldr (\x -> insertWith (+) x 1) M.empty

-- record syntax : permet d'acceder directement a x, y et r de Circle
data Shape = Circle { x :: Float, y :: Float, r :: Float } 
			-- syntaxe normale, pas d'acces aux variables
           | Rectangle (Float, Float) (Float, Float)
           deriving (Eq, Show) -- pour les comparer et les afficher
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle (a,b) (c,d)) = (abs $ a-c) * (abs $ b-d)

perimeter :: Shape -> Float
perimeter (Circle _ _ r) = 2 * pi * r
perimeter (Rectangle (a,b) (c,d)) = 2 * (abs $ a-c) + 2 * (abs $ b-d)