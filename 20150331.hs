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
--Exerc Monitoria----------------------------------------------------------------------------------------------
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
--lista com correspondecia Char -> Int
conHexToDeci :: [(Char, Int)]
conHexToDeci = zip (['1'..'9']++['A'..'F']) ([1..15])
hexToDeci:: Char-> [(Char,Int)]-> Int
hexToDeci x ll = [num| (numHex,num)<-ll, x == numHex]!!0
--cada elemento da String -> Decimal
fun :: [Char]->[(Char,Int)]->[Int]
fun [] ll = []
fun numHex ll
	|numHex == [] = []
	|otherwise = [hexToDeci x ll|x<-numHex]
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
somatorioHexadecimal :: [Char]->[(Char,Int)]->String
somatorioHexadecimal n ll = deciToHexa (sum (fun (n) (ll)))
--Q3
func :: [Int]->Int
func [] = 0
func (a:as) = a*(16^((length (a:as))-1)) + func (as)
inverte::String->String
inverte "" = ""
inverte x = [last x] ++ inverte (take((length x)-1) x)
palindromoDecimal :: [Char] -> [Char]
palindromoDecimal "" = ""
palindromoDecimal ll
	|(num == inv )= num ++ "- PALINDROMO"
	|otherwise = num ++ "- NAO PALINDROMO"
	where num = (show (func (fun (ll) (conHexToDeci))));
		  inv = inverte num
--Q4
type Vector = [Double]
type Matrix = [Vector]
mA::Matrix
mB::Matrix
mA = [[1,2],[2,3]]
mB = [[1,1],[1,1]]
--multiplica posições e depois soma
calc :: Vector->Vector->Double
calc v1 v2 = sum [a*b| (a,b)<-zip v1 v2]
getCol::Matrix->Matrix
getCol (x:xs)
	|length x == 1 = [[head x|x<-(x:xs), x/=[]]]
	|True = [map head (x:xs)] ++ getCol (map (tail) (x:xs))
multiplicaMatrizes:: Matrix->Matrix->Matrix
multiplicaMatrizes (x:[]) y = [map (calc x) (getCol y)]
multiplicaMatrizes (x:xs) y
	|length x == length y = [map (calc x) (getCol y)] ++ multiplicaMatrizes (xs) (y)
	|otherwise = [[]]
