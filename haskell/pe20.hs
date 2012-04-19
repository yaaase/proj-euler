module Main where

  pe20 = sum [read [x] | x <- show $ product [x | x <- [1..100]]]
