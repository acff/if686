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
	

