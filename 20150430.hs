{-Aula 8-}
data Failable t = Correct t| Error String deriving (Show)

instance Monad Failable where
	(>>=) (Correct t) f = f t
	(>>=) (Error t) _ = Error t
	return t = Correct t

data FilaT t = Nil | Fila t (FilaT t) Int deriving (Show, Eq)

criarFila :: Int -> t -> Failable (t, FilaT t)
criarFila size num 
	|size < 1 = Error "size < 1!"
	|otherwise = Correct (num, Fila num (Nil) size)

tamanho :: FilaT t -> Int
tamanho Nil = 0
tamanho (Fila _ nextElem _) = 1 + tamanho nextElem

retornaFila :: (Eq t) => t -> FilaT t -> FilaT t
retornaFila num (Fila x nextElem size)
	|nextElem == Nil = (Fila x (Fila num Nil size) size)
	|otherwise = Fila x (retornaFila num nextElem) size

push :: (Eq t) => t -> FilaT t ->  Failable (t, FilaT t)
push num (Fila x nextElem size)
	|((tamanho (Fila x nextElem size)) >= size) = Error "Fila cheia :I "
	|otherwise = Correct (num, retornaFila num (Fila x nextElem size))

pop :: FilaT t -> Failable (t, FilaT t)
pop Nil = Error "Fila vazia :I"
pop (Fila x nextElem size) = Correct (x, nextElem)