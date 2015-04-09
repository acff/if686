--slide 14
member :: Eq t => t -> [t] ->Bool
member e l = foldr (||) False (map (==e) l)

union :: Eq t => [t] -> [t] -> [t]
union ll1 [] = ll1
union [] ll2 = ll2
union ll1 ll2 = foldr (++) ll2 [ll1]
 
--slide 15
base :: [(Char, Int)]
base = zip ['a'..'z'] [1..26]

charToInt:: [(Char, Int)] -> Char -> Int
charToInt (x:xs) a
	|(a == fst x) = snd (x)
	|otherwise = charToInt xs a

stringToInt :: String -> Int
stringToInt s = foldr (+) 0 (map (charToInt) s)

--fun :: [String] -> [Int]
--fun (a:as) = 
