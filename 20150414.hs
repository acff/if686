--Trabalho 7
--Q1
compose :: (Eq a, Num a) =>(a -> a) -> [(a -> a)] -> [(a -> a)]
compose a [] = []
compose a (x:xs) = [a.x] ++ compose a xs

--Q2
type Valor = Int
type Aresta a = (a, a, Valor) 
data Grafo  a = NilG | Grafo [a] [Aresta a]  deriving (Eq, Show)

mapGraph :: (a -> b) -> Grafo a -> Grafo b
mapGraph f NilG = NilG
mapGraph f (Grafo llNo ll) = Grafo [f x| x <- llNo ] [(f x, f y, v) | (x, y, v) <-ll ]

--função -> elem ini -> grafo com a lista de nóe
foldGraph ::(a -> b -> b) -> b -> Grafo a -> b
foldGraph f base NilG = base
foldGraph f base (Grafo [] _) = base
foldGraph f base (Grafo (x:xs) ll) = f x (foldGraph f base (Grafo xs ll))

--Q3
data Tree t = 	NilT
				| Node t (Tree t) (Tree t)
				deriving (Eq, Show)

-- retorna floresta dos que obedem a função 
-- caso o nó não obedeça todas as subárvores dele serão eliminadas do retorno
filterNodes :: (t -> Bool) -> Tree t -> Tree t
filterNodes f NilT = NilT
filterNodes f (Node n l r)
 | f n = (Node n (filterNodes f l) (filterNodes f r))
 | otherwise = NilT

-- vai no nó que não obedece a função e chama filterNodes
-- para verificar quais nós que obedecem a função que foram ignorados anteriormente
findNextForest :: (t -> Bool) -> Tree t -> [Tree t]
findNextForest f NilT = []
findNextForest f (Node n l r)
 | f n = (findNextForest f l) ++ (findNextForest f r)
 | otherwise = (filterTree f l) ++ (filterTree f r)

--se a raiz obedece a função retorna a floresta a partir dela >>
--1- filterNode == floresta que parte da raiz
--2- floresta que pode existir dentro de um nó a esquerda que não obedece a função
--3- floresta que pode existir dentro de um nó a direita que não obedece a função
--senão chama apenas para árvore a esqueda e depois a direita
filterTree :: (t -> Bool) -> Tree t -> [Tree t]
filterTree f NilT = []
filterTree f (Node n l r)
 | f n = [filterNodes f (Node n l r)] ++ (findNextForest f l) ++ (findNextForest f r)
 | otherwise = (filterTree f l) ++ (filterTree f r)

