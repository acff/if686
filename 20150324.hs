swap  :: [Int]->Int->Int->[Int]
swap  v i j
		|(v == [] || i == j) = []
		|j > i = (take (i) v) ++ ((v!!j):[]) ++ (drop (i+1) (take (j) v)) ++ ((v!!i):[]) ++ (drop(j+1)v)
		|otherwise = (take (j) v) ++ ((v!!i):[]) ++ (drop (j+1) (take (i) v)) ++ ((v!!j):[]) ++ (drop(i+1)v)

bubHeap :: [Int]->Int->[Int]
bubHeap v i
		|(v == [] || i == 0) = v
		|((v!!i) > (v!!(div i 2))) = bubHeap (swap  (v) (i) (div i 2)) (div i 2)
		|otherwise = v
		
maxHeapInsert :: [Int]->Int->[Int]
maxHeapInsert v i
		|v == [] = i:[]
		|otherwise = bubHeap (v ++ i:[]) (length v)

heapify :: [Int] -> Int -> [Int] 
heapify v i
	|  2*i >= (length v) = v
	| ((2*i+1) < (length v)) && (v!!(2*i) < v!!(2*i +1) )  && (v!!(2*i +1) > (v!!(i))) = heapify (swap  v i (2*i + 1) ) (2*i + 1)
	| (v!!(2*i) > (v!!(i)) ) = heapify (swap  v i (2*i) ) (2*i)
	| otherwise = v

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
	

