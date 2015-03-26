existeElemento :: (Eq a) => [a]->a->Bool
existeElemento list x 
		|list == [] = False
		|(head list) == x = True
		|otherwise = existeElemento (tail list) x

contem :: (Eq a) => [a]->[a]->Bool
contem x y 
		|x == [] = True
		|otherwise = existeElemento y (head x) && contem (tail x) y
		
intersecao :: (Eq a) => [a]->[a]->Bool
intersecao x y 
		|(x == [])= False
		|existeElemento y (head x) = True
		|otherwise =  intersecao y (tail x)

comparaConjuntos :: (Eq t) => [t] -> [t] -> String
comparaConjuntos a b
		|(contem a b && contem b a) = "A igual a B"
		|contem a b = "B contem A"
		|contem b a = "A contem B"
		|intersecao a b = "A interseciona B"
		|otherwise = "conjuntos disjuntos"
		



