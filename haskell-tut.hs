{-
   comments
    -}

import Data.List
import System.IO

-- Int -2^63 2^63

maxInt = maxBound :: Int

-- Integer (Int grandotes)

sumOfNum = sum [1..100]

modEx = mod 5 4 -- Prefix operatior
modEx2 = 5 `mod` 4 -- lo convertimos en un mod nomral

negNumEx = 5 + (-4) -- negativos entre parentesis

num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9) --convertimos de Int to Float

createList = 3 : 7 : 21 : 55 : []

secondElement = createList !! 2 -- index of a list


