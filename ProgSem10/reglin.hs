{-
    Programa: reglin.hs
    Calcular  pendiente, ordenada, correl
-}

main = do
    putStr "Da la lista de valores X: "
    lineaX <- getLine
    putStr "Da la lista de valores Y: "
    lineaY <- getLine
    let
        x = read lineaX :: [Double]
        y = read lineaY :: [Double]
        sumaX = suma x
        sumaY = suma y
        sumaX2 = suma2 x
        sumaY2 = suma2 y
        sumaXY = suma2var x y
        n = length x
        promX = sumaX / (fromIntegral n :: Double)
        promY = sumaY / (fromIntegral n :: Double)
        desvX = sqrt (suma ([ xx-yy | xx <- x, yy <- [promX ]]) / (fromIntegral n :: Double))
        desvY = sqrt (suma ([ xx-yy | xx <- y, yy <- [promY ]]) / (fromIntegral n :: Double))
    putStrLn $ "Acumulado x: " ++ (show sumaX)
    putStrLn $ "Acumulado y: " ++ (show sumaY)
    putStrLn $ "Acumulado x2: " ++ (show sumaX2)
    putStrLn $ "Acumulado y2: " ++ (show sumaY2)
    putStrLn $ "Acumulado xy: " ++ (show sumaXY)
    putStrLn $ "Promedio x: " ++ (show promX)
    putStrLn $ "Promedio y: " ++ (show promY)
    putStrLn $ "Desv std x: " ++ (show desvX)
    putStrLn $ "Desv std y: " ++ (show desvY)

suma [] = 0
suma (x : resto) = x + (suma resto)

suma2 [] = 0
suma2 (x : resto) = x*x + (suma2 resto)

suma2var [] [] = 0
suma2var (x : restoX) (y : restoY) = x*y + (suma2var restoX restoY)

