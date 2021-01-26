{-
    Jorge David Elihu Mejia Castro, conjuntos.hs
-}

import Data.List

main :: IO ()
main = do
    putStr "Ingrese el primer conjunto: "
    first <- getLine
    putStr "Ingrese el segundo conjunto: "
    second <-getLine
    putStr $ "Primer conjunto: " ++ show first ++ "\n"
    putStr $ "Segundo conjunto: " ++ show second ++ "\n"
    putStr $ "A union B: " ++ show (union first second) ++ "\n"
    putStr $ "A inter B: " ++ show (intersect first second) ++ "\n"
    putStr $ "A - B: " ++ show (first \\ second) ++ "\n"
    putStr $ "B - A: " ++ show (second \\ first) ++ "\n"
