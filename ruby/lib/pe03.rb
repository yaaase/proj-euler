require 'prime'

n = 600851475143

Prime.each do |p|
  break if n.prime?
  n /= p while n % p == 0
  n = p if n < p
end

#puts n
