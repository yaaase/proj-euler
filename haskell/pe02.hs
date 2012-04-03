module Main where
  lazyFib x y = x:(lazyFib y (x + y))
  fib = lazyFib 1 1
  pe02 = sum [x | x <- (takeWhile (<4000000) fib), x `mod` 2 == 0]
