{-
        Jorge David Elihu Mejia Castro Automata 1
-}

import System.IO

main :: IO ()
main = do
  putStrLn "Ingrese la expreción matemática(+,-,/): "
  cadena <- getLine
  let
    file = openFile "codigo.asm" WriteMode
    var = getVariables cadena
    ope = getOperadores cadena
    op = getPosfija var ope
  putStr $ "la salida es " ++ (show var) ++ "\n"
  putStr $ "la salida es " ++ (show ope) ++ "\n"
  putStr $ "la salida es " ++ (show op) ++ "\n"
  writeFile "codigo.asm" (show op)

getPosfija :: String -> String -> String
getPosfija [] [] = []
getPosfija var op =
  let start = var !! 1
  in loop var op start

loop :: String -> String -> Char -> String
loop var@(h:t) op@(_:dx) buffer =
  cadena ++ pross var op buffer ++ loop t dx h
  where
    cadena = ""

pross :: String -> String -> Char -> String
pross [] [] _ = ""
pross (h:_) (hx:_) buff
  | hx == '+' = suma buff h
  | hx == '-' = resta buff h
  | hx == '/' = divi buff h
  | otherwise = "error"

getVariables :: String -> String
getVariables [] = []
getVariables st = [ c | c <- st, c `elem` ['a'..'z']]

getOperadores :: String -> String
getOperadores [] = []
getOperadores st = [ c | c <- st, c `elem` ['+','-','/']]

suma :: Char -> Char -> String
suma a b =
   "    push " ++ (show a) ++ "\n" ++
   "    push " ++ (show b) ++ "\n" ++
   "    pop " ++ (show a) ++ "x" ++ "\n" ++
   "    pop " ++ (show b) ++ "x" ++ "\n" ++
   "    add " ++ (show a) ++ "x" ++ (show b) ++ "x" ++ "\n" ++
   "    push " ++ (show a) ++ "x" ++ "\n"

resta :: Char -> Char -> String
resta a b =
  "     push " ++ (show a) ++ "\n" ++
  "     pop " ++ (show a) ++ "x" ++ "\n" ++
  "     pop " ++ (show b) ++ "x" ++ "\n" ++
  "     sub " ++ (show a) ++ "x" ++ (show b) ++ "x" ++ "\n" ++
  "     push " ++ (show a) ++ "\n"

divi :: Char -> Char -> String
divi a b =
  let
    c = [b..'z'] !! 1
  in
    "     push " ++ (show b) ++ "\n" ++
    "     pop " ++ (show b) ++ "x" ++ "\n" ++
    "     pop " ++ (show a) ++ "x" ++ "\n" ++
    "     mul " ++ (show b) ++ "x" ++ "\n" ++
    "     push " ++ (show a) ++ "x" ++ "\n" ++
    "     push " ++ (show c) ++ "\n" ++
    "     pop " ++ (show b) ++ "x" ++ "\n" ++
    "     pop " ++ (show a) ++ "x" ++ "\n" ++
    "     xor " ++ (show b) ++ "x" ++ (show c) ++ "x" ++ "\n" ++
    "     div " ++ (show b) ++ "x" ++ "\n" ++
    "     push " ++ (show a) ++ "x" ++ "\n"
