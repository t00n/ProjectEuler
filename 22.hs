import Data.Char

main = do txt <- readFile "p022_names.txt"
          let content = (read txt) :: [String]
          let sorted = sort content
          foldr (\x acc ) [(1, (head sorted))] sorted 

charToNum :: Char -> Int
charToNum c = (fromEnum c) - (fromEnum 'A')

alphaValue :: String -> Int
alphaValue = foldr (\x acc -> acc + (charToNum x)) 0

--unfinished