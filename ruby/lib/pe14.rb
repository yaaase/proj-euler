require 'rubygems'
require 'memoize'

include Memoize

# very slow

def collatz(n)
  count = 1
  return 1 if n == 1
  while true
    if n.even?
      n /= 2
      count += 1
    elsif n.odd?
      n = n*3 +1
      count += 1
    end
    break if n == 1
  end
  count
end

memoize(:collatz)

winner = 1
(1..1_000_000).map.each do |n|
  winner = n if collatz(n) > collatz(winner)
end
#puts winner
