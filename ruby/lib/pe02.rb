a, b, sum = 1, 1, 0

while b < 4_000_000
  sum += b if b % 2 == 0
  a, b = b, a + b
end

#puts sum
