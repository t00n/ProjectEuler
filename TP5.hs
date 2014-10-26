import LList

-- 1 : implement your own Eq typeclass

class Eq_ a where
    (===) :: a -> a -> Bool
    x === y = not $ x /== y
    (/==) :: a -> a -> Bool
    x /== y = not $ x === y

data BSTree k v = Empty | Node k v (BSTree k v) (BSTree k v)

instance (Eq k, Eq v) => Eq_ (BSTree k v) where
    Empty === Empty = True
    (Node k1 v1) === (Node k2 v2) = (k1 == k2)


-- 2
class Set s where
    empty :: s a
    add :: ( Eq a ) => a -> s a -> s a
    fold :: ( a -> b -> b ) -> b -> s a -> b
    union :: ( Eq a ) => s a -> s a -> s a
    remove :: ( Eq a ) => a -> s a -> s a
    member :: ( Eq a ) => a -> s a -> Bool
    size :: s a -> Int

instance Set [] where
    empty = []
    add x xs = if x `elem` xs then xs else x:xs
    fold = foldr 
    union s1 s2 = fold add s1 s2
    remove x s = fold (\x' s -> if x' /= x then s else x':s) empty s
    member x s = fold (\x' s -> s || x' == x) False s
    size = fold (\ _ i -> i + 1) 0

-- C'est mieux de mettre le plus d'implémentation dans le typeclass => cf solution

instance Set LList where
    empty = smartLList []


-- 2 - 2e partie

class (Eq a) => Set_ s a | s -> a where 
    empty_ :: s
    add_ :: a -> s -> s
    fold_ :: ( a -> b -> b ) -> b -> s -> b
    union_ :: s -> s -> s
    remove_ :: a -> s -> s
    member_ :: a -> s -> Bool
    size_ :: s -> Int

-- 3
data Scalar = Sc Int deriving Show
data Vector = Vc Int Int Int deriving Show

class Mult a b c | a b -> c where
    (*-*) :: a -> b -> c

instance Mult Scalar Vector Vector where
    (Sc a) *-* (Vc x1 y1 z1) = Vc x y z where
        x = a * x1
        y = a * y1
        z = a * z1

instance Mult Vector Vector Vector where

instance Mult Vector Vector Scalar where