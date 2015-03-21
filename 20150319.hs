--Aula 01
--Exercicio pag6
vendas :: Int-> Int
vendas x = x + 20

igual :: Int-> Int ->Int
igual a b = if (a == b) then (1)
			else (0)
			
fun :: Int->Int->Int
fun s n
		|n == 0 = igual(s)(vendas n)
		|otherwise = fun (s) (n-1) + igual(n) (vendas n)
		
--Exercicio pag14
--dobra elementos da lista
double :: [Int]->[Int]
double [] = []
double (a:as) = (a*2):(double as)

--verifica se x esta na lista
member :: [Int]->Int->Bool
member [] x = False
member (a:as) x
		|a == x = True
		|otherwise = member (as)(x)

--Verifica digitos na string		
digits :: String-> String
digits "" = ""
digits (a:as)
		|(a == '1')||(a == '2')||(a == '3')||(a == '4')||(a == '5')||(a =='6')||(a == '7')||(a == '8')||(a == '9')||(a == '0') = (a:digits(as))
		|otherwise = digits(as)
		
--Soma pares de lista		
sumPairs :: [Int]->[Int]->[Int]
sumPairs [] [] = []
sumPairs [] (x:xs) = x : sumPairs [] (xs)
sumPairs (a:as) [] = a : sumPairs (as) []
sumPairs (a:as) (x:xs) =(a+x):(sumPairs (as)(xs))

--quicksort pag 15	
quicksort ::[Int] -> [Int]
quicksort [] = []
quicksort (a:as) = (quicksort [y | y <- as, y < a])
                       ++ [a] ++
                      (quicksort [y | y <- as, y >=a])
					
