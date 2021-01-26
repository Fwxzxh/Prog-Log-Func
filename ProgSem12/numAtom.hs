{-
Jorge David Elihu Mejia Castro Num atomico
-}

main = do
  putStr "Numero atomico: "
  liena <- getLine
  let
    n = numAtomico elemento 1
      ["hidrogeneo","helio","litio","berilio","boro","carbono","nitrogeno"
      "oxigeno","fluor","neon","sodio","magnesio"]
  putStr $ "El numero atomico del " ++ elemento ++ " es " ++ (show n)
  configura
    n
    [2,2,6,2]
    ["1s","2s","2p","3s"]

configura 0 _ _ = do
  putStr ""
configura n (x:resto) (y:otros)

numAtomico _ _ [] = 0
