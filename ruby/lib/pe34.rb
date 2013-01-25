def factorial(n)
  (1..n).inject(1,&:*)
end

def sum_of_factorial(n)
  digits = n.to_s.split(//).map(&:to_i)
  sum = 0
  digits.each do |d|
    sum += factorial(d)
  end
  return true if sum == n
  return false
end

count = 0
3.upto(100_000) do |n|
  count += n if sum_of_factorial(n)
end
puts count
