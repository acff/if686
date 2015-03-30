
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
		
