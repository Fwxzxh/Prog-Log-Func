{-
   Jorge David Elihu Mejia Castro, base_n.hs
   hacer sumas y productos de numeros base B
-}

main :: IO ()
main = do
    putStrLn "Ingrese el número de inicio"
    inp1 <- getLine
    putStrLn "Ingrese el número final"
    inp2 <- getLine
    putStrLn "Ingrese la base"
    inp3 <- getLine
    let
        op1 = (read inp1::Int)
        op2 = (read inp2::Int)
        base = (read inp3::Int)
        lista = [op1,base..op2]
        suma = sum lista
        producto = product lista
    putStrLn $ "Sea: " ++ show op1 ++ " : " ++ show op2 ++ " Base: " ++ show base
    putStrLn $ "Suma: " ++ show suma
    putStrLn $ "Producto: " ++ show producto
    putStrLn $ "Lista: " ++ show lista


