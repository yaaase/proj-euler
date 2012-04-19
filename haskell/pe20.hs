module Main where

  pe20 = sum [read [x] + 0 | x <- show $ product [x | x <- [1..100]]]
