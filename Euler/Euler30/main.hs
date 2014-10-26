import           Data.Char (digitToInt)
import           System.IO (print)

main = print $ result 0 2

fifth :: Int -> Int
fifth = sum . map ((^5) . digitToInt) . show

result acc 1000000 = acc
result acc x       = if x == fifth x then result (acc+x) (x+1) else result acc (x+1)
