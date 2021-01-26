{-
        Programa: factorial.hs
-}

main = do
  putStr "Valor limite de fibonacci "
  linea <- getLine
  let
    n = read linea :: Int
    f = fibo n
  putStr $ "El termino es: " ++ (show f)

fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)
