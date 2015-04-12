data Shape = Circle Float 
             |Rectangle Float Float

area :: Shape -> Float
area (Circle r) = pi*(r)^2
area (Rectangle a h) = a*h

data Dias = Segunda Int [String] 
			| Terça Int [String]
			| Quarta Int [String]
			| Quinta Int [String]
			| Sexta Int [String]
			| Sabado 
			| Domingo 

terca :: Dias
quinta :: Dias
terca = Terça 2 ["PLC", "Bla"]
quinta = Quinta 2 ["Bla","Bla","PLC", "Bla"]

existe :: [String] -> String -> Bool
existe ll s 
		   |(head[x | x<- ll , x == s]) /= "" = True
		   |otherwise = False

fimSemana :: Dias -> Bool
fimSemana Sabado = True
fimSemana Domingo = True
fimSemana _ = False

aulaPLC:: Dias -> Bool
aulaPLC Domingo = False
aulaPLC Sabado = False
aulaPLC (Segunda h ll) = existe ll "PLC"
aulaPLC (Terça h ll) = existe ll "PLC"
aulaPLC (Quarta h ll) = existe ll "PLC"
aulaPLC (Quinta h ll) = existe ll "PLC"
aulaPLC (Sexta h ll) = existe ll "PLC"

{-Modifique o tipo Tree para que valores desse tipo sejam
comparáveis (para saber se são iguais) e que seja possível
transformá-los em Strings -}
data Tree t = NilT 
			 |Node t (Tree t) (Tree t) deriving (Eq, Show)

data Expr = Lit Int 
			|Add Expr Expr 
			|Sub Expr Expr

showExpr :: Expr -> String
showExpr (Lit n) = show n
showExpr (Add exprA exprB) = showExpr(exprA) ++ "+" ++ showExpr(exprB)
showExpr (Add exprA exprB) = showExpr(exprA) ++ "-" ++ showExpr(exprB)

data List t = Nil
			  |Cons t (List t)

toList :: List t -> [t]
toList Nil = []
toList (Cons a as) = a:toList(as)

fromList :: [t] -> List t
fromList [] = Nil
fromList (a:as) = Cons a (fromList as)

depth :: Tree t -> Int
depth NilT = 0
depth (Node r a b) = 1 + max (depth(a)) (depth(b))

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node r a b) = collapse a ++ [r] ++ collapse b

bfs :: Tree t -> t -> Bool
bfs NilT _ = False
bfs (Node t l r) n
	 | t == n = True
	 | otherwise = (bfs l n) || (bfs r n)

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ NilT = NilT
mapTree f (Node t l r) = Node (f t) (mapTree f l) (mapTree f r)

