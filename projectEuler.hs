

data Arbre a = Arbre | Feuille

main = do txt <- readFile "18.txt"
          let text = (map (words) (lines txt))
          let content = [(map readint l) | l <- text]



readint :: String -> Int
readint = read

adjacent :: [a] -> 