{-
   Jorge David Elihu Mejia Castro polinomio.hs
-}

main :: IO ()
main = do
  putStr "Polinomio: "
  poll <- getLine
  let variables = getVariables poll
      operadores = getOperadores poll
      potencias = getPotencias poll
  putStr $ "Es polinomio? " ++ (show (sintaxisPol poll 0)) ++ "\n"
  putStr $ "variables: " ++ (show variables) ++ "\n"
  putStr $ "operadores: " ++ (show operadores) ++ "\n"
  putStr $ "potencias" ++ (show potencias) ++ "\n"

esDigito :: Char -> Bool
esDigito x = and [x >= '0', x <= '9']

esSigno :: Char -> Bool
esSigno x = or [x == '+', x == '-']

esVariable :: Char -> Bool
esVariable x = or [x == 'x']

pross :: String -> String
pross [] = ""
pross (h:h1:h2:_)
  | and [esSigno h == True, esDigito h1 == True, esSigno h2 == True] = h2:""
  | and [esDigito h1 == True, esSigno h2 == True] = h2:""
  | otherwise = ""

sintaxisPol :: String -> Int -> Bool
sintaxisPol [] 2 = True
sintaxisPol [] 3 = True
sintaxisPol [] _ = False
sintaxisPol (x : resto) edo
  | and [edo == 0, esSigno x] = sintaxisPol resto 1
  | and [edo == 0, esDigito x] = sintaxisPol resto 2
  | and [edo == 0, x == 'x'] = sintaxisPol resto 3
  | and [edo == 1, esDigito x] = sintaxisPol resto 2
  | and [edo == 1, x == 'x'] = sintaxisPol resto 3
  | and [edo == 2, esSigno x] = sintaxisPol resto 1
  | and [edo == 2, esDigito x] = sintaxisPol resto 2
  | and [edo == 2, x == 'x'] = sintaxisPol resto 3
  | and [edo == 3, esSigno x] = sintaxisPol resto 1
  | and [edo == 3, esDigito x] = sintaxisPol resto 2
  | otherwise = False

-- iteramos sobre la lista, vemos si es signo, pot, argumento o variable
-- agrupamos la información en tuplas y con ella hacemos todo(?) :thinking_face:
getOperadores :: String -> String
getOperadores st = [c | c <- st, c `elem` ['+', '-']]

getVariables :: String -> String
getVariables st = [c | c <- st, c `elem` "x"]

getPotencias :: String -> String
getPotencias [] = ""
getPotencias n
  | length n < 2 = ""
getPotencias (h:h1:t)
  | h == '^' = h1 : getPotencias t
  | otherwise =  getPotencias (h1:t)
