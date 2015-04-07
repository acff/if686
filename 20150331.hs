--Q1
{-Classes de tipos em Haskell sao uma maneira de usar polimorfismo
sobrecarga, como existe em linguagens como Java. Pense com cuidado e
explique quais s̃ao as vantagens e desvantagens de usar essa abordagem para
polimorfismo de sobrecarga, em comparacao com a abordagem usada por Java. 

R: Classes de tipos são como interfaces que definem um comportamento. Se temos um tipo que faz parte da classe 
estamos assumindo que ele suporta e implementa o comportamento oferecido pela classe.
O polimorfismo de sobrecarga é utilizado quando temos funções com o mesmo nome, mas definições distintas.
Em Java podemos definir metodos com o mesmo nome, porém com quantidade/tipo de parametros distintos.Em Haskell
as classes de tipo permitem definir diferentes tipos para uma função, facilitando sua definição(o uso da sobrecarga).

http://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similarities

-}

--Q3
type Vertice = Int
type Aresta = (Vertice, Vertice)
type Grafo = [Aresta]

grafoBase :: Grafo
grafoBase = [
		(1,2), (1,3), (1,4), (1,5),
		(2,6), (2,7), (4,8), (5,9)
	]

adjacentes :: Grafo -> Vertice -> [Vertice]
adjacentes [] _ = []
adjacentes ((a,b):c) v
		| (a == v) = b:(adjacentes c v)
		| (b == v) = a:(adjacentes c v)
		| otherwise = adjacentes c v
		
search :: Grafo->Vertice->Vertice->[Vertice]
search [] x y = []
  
  
--Q4
baseMatriz :: [[Int]]
baseMatriz = [[1,2,3],[4,5,6],[7,8,9]]

quickSort :: (Ord x) => [x] -> [x]
quickSort [] = []
quickSort (h:t) = quickSort([ a|a <- t, a < h ])++(h:[])++quickSort([ a|a <- t, a >= h ])

mediana :: [Int]->Int
mediana [] = 0
mediana list
		|mod (length list) 2 == 0 = quickSort (list)!!((div (length list) 2)-1)
		|otherwise = quickSort (list)!!(div (length list) 2)	
		
filtroMediana :: [[Int]]->Int->[Int]
filtroMediana [[]] n =[]
		
-- Exerc (aula monitoria)
--Q1
listaEstados :: [Int]
listaEstados  = [1, 2, 3]

listaTransicoes :: [(Int, Int, Char)]
listaTransicoes = [(1, 1, '1'), (1, 3, '0'), (3, 2, '1')]

listaAceitacao :: [Int]
listaAceitacao = [2]

listaT ::[(Int, Int, Char)] -> [Int]
listaT [] = []
listaT (a:as) = fst(a) ++ listaT (as)

--transicao :: Char->Int->[(Int, Int, Char)]->Int


--     cadeia->lista estados->lista transições->estado inicial->lista aceitação
--afd :: [Char]-> [Int]-> [(Int, Int, Char)]-> Int-> [Int] -> Bool
--afd [] le lt inicial la = []



