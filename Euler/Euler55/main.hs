module Main where

import           System.IO (print)

main = print solution

revNum :: Integer -> Integer
revNum = read . reverse . show

palindrome :: Integer -> Bool
palindrome n = (show n)  == (reverse $ show n)

findPali :: Integer -> Int -> Bool
findPali n iter | iter == 50 = False
                | palindrome sumrev = True
                | otherwise = findPali sumrev (iter+1)
                where sumrev = n + revNum n

solution = foldr (\x acc -> if not (findPali x 1) then acc +1 else acc) 0 [1..9999]
