-- MERGESORT -----------------------------------------------
merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
 | x < y = x:(merge xs (y:ys))
 | otherwise = y:(merge (x:xs) ys)

mergesort :: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort first) (mergesort second)
 where
 	(first, second) = splitAt (((length xs) + 1) `div` 2) xs

-- HEAPSORT -----------------------------------------------

right :: Int->Int
right i = 2*i +1

left :: Int->Int
left i = 2*i

swap :: [Int]->Int->Int->[Int]
swap v i j
	|(v == [] || i == j) = []
	|otherwise = (take (i) v) ++ ((v!!j):[]) ++ (drop (i+1) (take (j) v)) ++ ((v!!i):[]) ++ (drop(j+1)v)

heapify :: [Int] -> Int -> [Int] 
heapify v i
	|  left i >= (length v) = v
	| ((right i) < (length v)) && (v!!(left i) < v!!(right i) )  && (v!!(right i) > (v!!(i))) = heapify (swap  v i (right i) ) (right i)
	| (v!!(left i) > (v!!(i)) ) = heapify (swap  v i (left i) ) (left i)
	| otherwise = v

bubHeap :: [Int]->Int->[Int]
bubHeap v i
		|(v == [] || i == 0) = v
		|((v!!i) > (v!!(div i 2))) = bubHeap (swap  (v) (i) (div i 2)) (div i 2)
		|otherwise = v
		
maxHeapInsert :: [Int]->Int->[Int]
maxHeapInsert v i
		|v == [] = i:[]
		|otherwise = bubHeap (v ++ i:[]) (length v)

order :: [Int] -> [Int]
order v
	| v==[] = [] 
	| otherwise = ((v!!0):[])++(order (heapify (take((length v)-1) (swap  v 0 ((length v)-1))) 0) )

buildMaxHeap :: [Int] -> [Int] -> [Int]
buildMaxHeap v heap
	| v ==[] = order heap
	| otherwise = buildMaxHeap (tail v) (maxHeapInsert heap (head v) )

heapSort :: [Int] -> [Int] 
heapSort v
	|v == [] =[]
	|otherwise = buildMaxHeap v []
	
-- EXERCICIO AULA 2 -----------------------------------------------	
--Slide 7
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

coordX :: Ponto-> Float
coordX p = fst p

coordY :: Ponto-> Float
coordY p = snd p

vertical :: Reta-> Bool
vertical x = fst (fst x) == fst (snd x)

--Slide 14
type Pessoa = String
type Livro = String 
type BancoDados = [(Pessoa, Livro)]
baseExemplo :: BancoDados

baseExemplo = 
 [("Sergio","O Senhor dos Aneis"),
 ("Andre","HP"),
 ("Ana","HP"),
 ("Andre","LLL"),
 ("Fernando","Jonathan Strange & Mr. Norrell"), 
 ("Fernando","A Game of Thrones")]

{-Funções sobre o banco de dados - consultas -}
livros:: BancoDados->Pessoa->[Livro]
livros [] _ = []
livros base x 
	|base == [] = []
	|fst (head base) == x = snd(head base):livros (tail base) x
	|otherwise = livros (tail base) x
	
emprestimos:: BancoDados->Livro ->[Pessoa]
emprestimos base l
	|base == [] = []
	|snd (head base) == l = fst(head base):emprestimos (tail base) l
	|otherwise = emprestimos (tail base) l
	
emprestado:: BancoDados->Livro->Bool
emprestado base l
	|base == [] = False
	|snd (head base) == l = True
	|otherwise = emprestado (tail base) l
	
qtdEmprestimos:: BancoDados->Pessoa->Int
qtdEmprestimos base p
	|base == [] = 0
	|fst (head base) == p = 1 + qtdEmprestimos (tail base) p
	|otherwise = qtdEmprestimos (tail base) p
	
livrosA ls pp = [l |(p,l)<-ls, p == pp]
emprestimosA base ll = [l |(p, l)<-base, l == ll]
emprestadoA base ll = [l | (p,l)<-base, l == ll]
qtdEmprestimosA base pp = length [p | (p,l)<-base, p == pp ]

--Slide 15
{-Funções sobre o banco de dados - atualizações -}

emprestar:: BancoDados->Pessoa->Livro->BancoDados
emprestar base p l 
		|base == [] = [(p, l)]
		|emprestado base l == True = base
		|otherwise = base ++ [(p, l)]
		
devolver:: BancoDados->Pessoa->Livro->BancoDados
devolver base p l
		|base == [] = []
		|(fst(head base) == p) && (snd(head base) == l)  = (tail base)
		|otherwise = devolver (tail base) p l
		
devolverA base p l = [(pp,ll)| (pp,ll)<- base, pp /= p || ll /= l]

	















	
	



