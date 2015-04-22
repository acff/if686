--slide 29 (AULA 5)
f = (\t u -> (>10) t && (<10) u)
g fun = (\u t -> (>10) t && (<10) u)

--slide 30
{-Dada uma lista de pares, devolver uma lista contendo apenas os
primeiros elementos de cada par-}
fstPares = (\ll -> map (fst) ll)

{-Dados uma lista de listas de números e um número n, devolver
uma lista contendo todas cujo comprimento seja maior que n-}
filterList =(\ll x -> [i | i<- ll, (length i) > x])

{-Dada uma lista de listas, criar uma lista que contém todos os
elementos das sub-listas da lista de entrada, mas removendo
duplicação:-}
bigList :: (Eq a) => [[a]] -> [a]
bigList list = (bigList'. concat) list
 where
     bigList' = \(x:xs) -> if xs == [] then [] else x : bigList' (filter (\y -> not ((==) x y)) xs)

--AULA 6 ------------------------------------------------------
--slide 3
{-Somar uma constante x a todos os elementos de uma
lista de números-}
sumConst :: Int -> ([Int] -> [Int])
sumConst c = map (+c)

{-Dada uma lista de números, obter o maior da lista-}
maxList :: (Ord a) => [a] -> a
maxList = maximum

{-Dada uma árvore binária, devolver uma função
que, dada uma árvore binária, verifica se as duas
árvores são isomórficas-}

