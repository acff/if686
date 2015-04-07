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
showExpr (Add Expr Expr) = 

{-
showExpr :: Expr -> String

toList :: List t -> [t]

fromList :: [t] -> List t

depth :: Tree t -> Int

collapse :: Tree t -> [t]

bfs :: Tree t -> t -> Bool

mapTree :: (t -> u) -> Tree t -> Tree u 
-}
