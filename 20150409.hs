--slide 7
raizQ :: [Float] -> [Float]
raizQ ll = map (sqrt) ll

posicaoAlfabeto :: String -> [(Char, Int)] -> [Int]
posicaoAlfabeto ll base = map (charToInt base) ll 

mapA :: (a->b) -> [a] -> [b]
mapA func ll = [func x | x<-ll]

--slide 14
member :: Eq t => t -> [t] ->Bool
member e l = foldr (||) False (map (==e) l)

unionA :: Eq t => [t] -> [t] -> [t]
unionA ll1 [] = ll1
unionA [] ll2 = ll2
unionA ll1 ll2 = foldr (++) ll2 [ll1]
 
--slide 15
base :: [(Char, Int)]
base = zip ['a'..'z'] [1..26]

charToInt:: [(Char, Int)] -> Char -> Int
charToInt (x:xs) a
	|(a == fst x) = snd (x)
	|otherwise = charToInt xs a

stringToInt :: [(Char, Int)] -> String -> Int
stringToInt base s = foldr (+) 0 (map (charToInt base) s)

fun :: [String] -> [(Char, Int)] -> [Int]
fun [] base = []
fun (a:as) base = [(stringToInt base a)] ++ (fun as base)

--slide 16
data Tree a = EmptyTree 
    		  | Node a (Tree a) (Tree a) deriving (Show, Read, Eq) 
    			  
insert :: (Ord a) => Tree a -> a -> Tree a
insert EmptyTree x = Node x EmptyTree EmptyTree  
insert (Node a l r) x 
	|x == a = Node x l r
	|x > a = Node a l (insert r x)
	|x < a = Node a (insert l x) r 

createTree :: (Ord t) => [t]-> (Tree t -> t -> Tree t) -> Tree t
createTree [] func = EmptyTree
--createTree (a:as) func = foldr (func) a (as)

--slide 19
--outra definição >>>filter p l = [a | a <- l, p a]
filterA :: (t->Bool) -> [t] -> [t]
filterA f [] = []
filterA f (a:as) 
	|f a = a:filterA f as
	|otherwise = filterA f as

funMenor :: [Int] -> [Int]
funMenor ll = filterA (>0) ll

--slide 20
exist :: Int -> [Int] -> Bool
exist n [] = False
exist n (a:as)
		| n == a = True
		| otherwise = exist n as 
		
existe :: [Int] -> [Int] -> [Bool]
existe [] ll2 = [False]
existe ll1 [] = [False]
existe (a:as) ll2 
	|(exist (a) (ll2)) = (True:(existe (as) (ll2 )))
	| otherwise = existe (as) (ll2)

--inter :: [Int] -> [Int] -> [Int]
--inter a b = filter (&&) (existe a b)
		








  			   
