module Main where

  lazyFib x y = x:(lazyFib y ( x + y))
  fib = lazyFib 0 1

  pe25 = length (takeWhile (< (10^999)) fib)
