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






