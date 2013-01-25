require 'prime'

primes = []
while primes.length <= 10001
  Prime.each do |n|
    primes << n
  end
end
#puts primes[-1]
