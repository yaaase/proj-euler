require 'prime'

def truncatable?(n)
  return false unless n.prime?
  left, right = n.to_s.split(''), n.to_s.split('')
  all_prime?(left,0) && all_prime?(right,-1)
end

def all_prime?(ary, ind)
  return false if ary.length < 2
  while ary.length > 1
    ary.delete_at(ind)
    return false unless ary.join.to_i.prime?
  end
  return true
end

sum = 0
time = Time.now
Prime.each(1_000_000) do |prime|
  next if prime.to_s[1..-2] =~ /[2468]/
  sum += prime if truncatable?(prime)
end

puts "Solved: #{sum} in #{Time.now - time} seconds."
