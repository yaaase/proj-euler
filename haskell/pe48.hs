module Main where

  getNum :: Integer -> [Char]
  getNum n = show(sum [x^x | x <- [1..n]])
  
  lastTen = drop (length (getNum 1000) - 10) (getNum 1000)
