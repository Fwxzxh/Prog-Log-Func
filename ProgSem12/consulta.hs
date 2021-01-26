{-
Jorge David Elihu Mejia Castro consulta
-}

main :: IO ()
main = do
  contenido <- readFile "datos.txt"
  let datos = lines contenido
  putStr "Da tu consulta"
  entrada <- getLine
  let palabras = words entrada
  procesa palabras datos

procesa String -> String -> String
procesa _ [] = do
  putStr ""
procesa palabras (x:resto) = do
  coincide palabras (words x)
  procesa palabras resto

coincide :: String -> String -> String
coincide palabras renDatos
  | ocurrencias palabras renDatos == 2 = do
      putStrLn $ (renDatos !! 0) ++ " de " ++
        (renDatos !! 1) ++ ": " ++ (renDatos !! 2)
  | otherwise = do
      putStr ""

ocurrencias :: String -> String -> String
ocurrencias [] _ = 0
ocurrencias (x:resto) renDatos
  | or [x == head renDatos, x == head (tail renDatos)] =
    1 + ocurrencias resto renDatos
  | otherwise = ocurrencias resto renDatos
