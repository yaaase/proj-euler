a, b, counter = 1, 1, 2
while b.to_s.size < 1000
  a, b = b, a + b
  counter += 1
end
#puts counter
