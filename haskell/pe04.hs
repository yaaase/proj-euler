module Main where

  prods = [x * y | x <- [100..999], y <- [100..999]]
  pe04 = maximum [n | n <- prods, (show n) == reverse(show n)]
