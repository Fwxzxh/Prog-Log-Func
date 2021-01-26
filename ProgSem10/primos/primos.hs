

main = do
  putStr " ingrese el numero"
  linea <- getLine
  let n = read linea :: Int
  sieve' [n]
  primes n

primes :: [Integer]
primes = 2 : filter (isPrime primes) [3,5..]
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
  
sieve' :: [Int] -> [Int]
sieve' [] = []
sieve' xs = ys ++ sieve [z | z <- zs, and $ map (\ y -> z `mod` y /= 0) ys] 
    where (ys, zs) = span (< 2 * head xs) xs
