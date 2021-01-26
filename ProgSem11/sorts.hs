{-
    Mejia Castro jorge David Elihu Sorts inserción
-}

main :: IO()
main = do
  putStr "Da la lista de enteros: "
  linea <- getLine
  let
    original = read linea :: [Int]
    ordenadaQuick = qsort original
    ordenadaMerge = mergeSort original
    ordenadaSelection = seqSort original
    ordenadaInsercion = inSort original
  putStr $ "Lista original: " ++ show original ++ "\n"
  putStr $ "Ordenada quick: " ++ show ordenadaQuick ++ "\n"
  putStr $ "Ordenada mezcla: " ++ show ordenadaMerge ++ "\n"
  putStr $ "Ordenada selección: " ++ show ordenadaSelection ++ "\n"
  putStr $ "Ordenada inserción: " ++ show ordenadaInsercion ++ "\n"

qsort :: [Int] -> [Int]
qsort [] = []
qsort (x: resto) =
  qsort [y | y <- resto, y <= x] ++ [x] ++ qsort [y | y <- resto, y > x ]

--------------------------------------------

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort xs
  | length xs > 1 = merge (mergeSort ls) (mergeSort rs)
  | otherwise = xs
  where (ls, rs) = mergeSplit xs

mergeSplit :: [a] -> ([a],[a])
mergeSplit xs = (take n xs, drop n xs)
  where n = length xs `div` 2

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys)
  | x < y = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys

--------------------------------------------

seqSort :: (Eq a, Ord a) => [a] -> [a]
seqSort [] = []
seqSort xs = s : seqSort (removeElement s xs) where s = minimum xs

removeElement :: Eq a => a -> [a] -> [a]
removeElement _ [] = []
removeElement val (x:xs)
  | val == x = xs
  | otherwise = x : removeElement val xs

--------------------------------------------

inSort :: Ord a => [a] -> [a]
inSort [] = []
inSort (x:xs) = insert x (inSort xs)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
  | x < y = x:y:ys
  | otherwise = y:(insert x ys)
