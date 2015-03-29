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
  
		