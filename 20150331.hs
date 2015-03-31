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
		

--Exerc Monitoria
--Q1
listaEstados :: [Int]
listaEstados = [1, 2, 3]

listaTransicoes :: [(Int, Int, Char)]
listaTransicoes = [(1, 1, '1'), (1, 3, '0'), (3, 2, '1')] 

listaAceitacao :: [Int]
listaAceitacao = [2]

proxEstado :: [(Int, Int, Char)]->Int->Char->Int
proxEstado [] _ _ = 0
proxEstado ((x,y,z):as) estadoAtual input
		|((x == estadoAtual) && (z == input)) = y
		|otherwise = proxEstado as estadoAtual input
			 
--entrada->lEstados->llTransicao->estadoInicial->lAceitacao
afd :: [Char]->[Int]->[(Int, Int, Char)]->Int->[Int]->Bool
afd (a:as) lEstados lTransicao estadoInicial lAceitacao
	|[proxEstado lTransicao estadoInicial a ] == [x| x<-lAceitacao, as == []] = True
	|as == [] = False
	|otherwise = afd as lEstados lTransicao estadoAtual lAceitacao
	where estadoAtual = proxEstado lTransicao estadoInicial a 
	
	
--Q2
--finalizar 
hexaDecimal :: [String]->[Int]
hexaDecimal [] = []
hexaDecimal (a:as) = ((read a::Int):hexaDecimal as)

deciToHexa :: Int->String
deciToHexa 0 = ""
deciToHexa num 
	|mod num 16 == 10 = deciToHexa(d) ++"A"
	|mod num 16 == 11 = deciToHexa(d) ++"B"
	|mod num 16 == 12 = deciToHexa(d) ++"C"
	|mod num 16 == 13 = deciToHexa(d) ++"D"
	|mod num 16 == 14 = deciToHexa(d) ++"E"
	|mod num 16 == 15 = deciToHexa(d) ++"F"
	|otherwise = deciToHexa(d) ++ show ((mod num 16)::Int)
	where d = div num 16
		
somatorioHexadecimal :: [String]->String
somatorioHexadecimal n = deciToHexa (sum (hexaDecimal(n)))

{--Q3 
palindromoDecimal :: String->String
palindromoDecimal "" = ""
palindromoDecimal (a:as)
		|a == []= ""
		|a == "A" =  -}
		

--Q4
type Vector = [Double]
type Matrix = [Vector]

mA::Matrix
mB::Matrix
mA = [[1,2],[2,3]]
mB = [[1,1],[1,1]]

getElemPos :: Matrix->Int->Int->Double
getElemPos m i j = (m!!(i-1))!!(j-1)

mult :: Vector->Vector->Double
mult a b = sum [x*y|(x,y)<-zip a b]

col:: Matrix->Matrix
col (a:as)
		|length a == 1 = [[head x|x<-(a:as), x/=[]]]
		|True = [map head (a:as)]++col(map tail (a:as))
		

mult :: Matriz -> Matriz -> Matriz
mult (x:[]) b = [map (mult x) (col b)]
mult (x:xs) b 
		| length x == length b = [map (pp x) (col b)] ++ (mult xs b)
        | True = error "-------------------"

multiplicaM :: Matrix-> Matrix-> Matrix
multiplicaM [] _ = [[]]

--multiplicaM 




















	
	
