-- para usar o sort
import Data.List 
--Aula 01---------------------------------------------------
{-Implemente uma função que, dado um número inteiro
N, retorne uma lista de inteiros com os N primeiros
números pares da sequência de Fibonacci.-}

fib::Int->[Int]
fib 0 = [0]
fib 1 = [1, 0]
fib n = (head (fib (n-1)) + head (fib (n-2))) : fib (n-1)

fibPar :: Int -> [Int]
fibPar n = (filter (even) (fib n))

{-Crie um função que recebe uma lista de inteiros e
retorna a lista ordenada em função da soma de seus 
digitos(crescente)-}
sumDig :: Int -> Int
sumDig n
	|n < 10 = n
	|otherwise =  (div n 10) + (mod n 10)

sumList :: [Int] -> [(Int, Int)]
sumList (x:xs) = [((sumDig a), a) | a <-(x:xs)]

order :: [Int] -> [Int]
order ll = [snd x | x <- sort (sumList ll)]

--Aula 02---------------------------------------------------
{-Defina a função menorMaior que recebe
três inteiros e retorna uma tupla com o
menor e o maior deles-}
funA :: Int -> Int -> Int -> (Int, Int)
funA a b c = (head ll, last ll)
			where ll = sort [a,b,c]

{-Defina a função ordenaTripla que
recebe uma tripla de inteiros e ordena a 
mesma-}
funB :: (Int, Int, Int) -> (Int, Int, Int)
funB (a,b,c) = (ll!!0, ll!!1,ll!!2)
				where ll = sort [a,b,c]

{-Definir função pontoY-}
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

pontoY :: Float -> Reta -> Float
pontoY x ((x1,y1), (x2,y2))
	 | x1 == x2 = 0.0
	 | otherwise = ((y2 - y1)/(x2 - x1)) * (x - x1) + y1

{-Processamento de Texto-}
getWord :: String -> String
getWord s = takeWhile (/= ' ') s

droWord :: String -> String
droWord s = dropWhile (/= ' ') s

dropSpace :: String -> String
dropSpace s = (dropWhile (== ' ') s)

type Word = String
splitWords :: String -> [Word]
splitWords "" = []
splitWords s = ((getWord s) :splitWords (dropSpace(droWord s)))


-- AULA 6 (slide 8) ANOTAÇÃO
--exemplo 01
filter (>0). map (+1) :: ?

      (Num t) => (t->t)
map ::(a -> b) -> [a] -> [b]
map (+1) :: Num t => [t] -> [t] -- usou t por causa do 1

		(Num t, Ord t) => (t -> Bool)
filter :: (c -> Bool) -> [c] -> [c]
filter (>0) :: (Num t , Ord t)=> [u]->[u]

(.) :: (u -> v) -> (t-> u) -> (t->v) -- primeiro aplica o segundo param

(u -> v) == (Num t , Ord t)=> [u]->[u] -- filter
(t -> u) == Num t => [t] -> [t] -- map
--obs o 'u' tem q ser do mesmo tipo. O filter é mais especifico do q map. LOGO...
**(t -> u) == (Num t, Ord t) => [t] -> [t] --  insere Ord no map, por ser o mais geral
-- **obs t = u = i
(t -> v) == (Num i, Ord i) => [i] -> [i]

--exemplo 02
map.foldr
map ::(a -> b) -> [a] -> [b]
foldr :: (c -> d -> d) -> d -> [c] -> d
(.) :: (u -> v) -> (t-> u) -> (t->v)

--map
u == (a -> b)
v == [a] -> [b]
--foldr
t == (c -> d -> d)
u == d -> ([c] -> d)
-- o 'u' ficou diferente de map para foldr
-- b pode ser qualquer tipo inclusive uma função 
a == d
b == ([c] -> d)
--modificando
--map
u == (d -> ([c] -> d))
v == [d] -> [([c] -> d)]
--resultado 
(t-> v) == (c -> d -> d) -> ([d]->[[c]->d])