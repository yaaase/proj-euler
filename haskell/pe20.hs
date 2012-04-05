module Main where

  factorial :: Integer -> Integer
  factorial n
    | n == 0         = 1
    | otherwise = n * factorial (n - 1)

  pe20 = sum [read [x] + 0 | x <- show(factorial 100)]
