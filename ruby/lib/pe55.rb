def lychral? x
  current_iteration = 1
  sum = sum_of_reverse x
  while current_iteration < 50 do
    return false if palindrome? sum
    sum = sum_of_reverse sum

    current_iteration += 1
  end
  return true
end

def sum_of_reverse x
  x + x.to_s.reverse.to_i
end

def palindrome? x
  x.to_s == x.to_s.reverse
end

time, lychral_numbers = Time.now, []

1.upto(10_000) do |number|
  lychral_numbers << number if lychral? number
end

#puts "Solved: #{lychral_numbers.size} in #{Time.now - time} seconds"
