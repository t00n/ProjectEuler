-- todo hide modules to allow only smartLList
module LList (LList, smartLList, lengthL, consL, headL, tailL, appendL)
	where
-- creates a constructor that takes an int and a list
data LList a = LList { getLen :: Int,
                       getList :: [a]
                      }
                      deriving (Eq, Show)

smartLList :: [a] -> LList a
smartLList xs = LList (length xs) xs

lengthL :: LList a -> Int
lengthL = getLen

consL :: a -> LList a -> LList a
consL a l = LList ((getLen l) + 1) (a:(getList l))

headL :: LList a -> a
headL = head . getList

tailL :: LList a -> LList a
tailL l = LList ((getLen l) - 1) (tail (getList l))

appendL :: LList a -> LList a -> LList a
appendL l1 l2 = LList ((getLen l1) + (getLen l2)) ((getList l1) ++ (getList l2))