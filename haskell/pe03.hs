module Main where

  prime :: Float -> Bool
  prime 2 = True
  prime x
    | x <= 1                                                              = False
    | (round x) `mod` 2 == 0                                              = False
    | True `elem` [((round x) `mod` n == 0) | n <- map round [2..sqrt x]] = False
    | otherwise                                                           = True

  primeNth x = head (drop (x - 1) (take (x) [n | n <- [1..], prime n]))
