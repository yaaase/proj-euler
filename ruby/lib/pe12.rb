# this sucks and takes forever

def divisors(n)
  divs = []
  (1..(n/2)).select { |d|
    divs << d if n % d == 0
  }
  divs << n
  divs.size
end

def triangle_generator(n)
  num = 0
  1.upto(n) do |d|
    num += d
  end
  num
end

start = 1
while true
  break if divisors(triangle_generator(start)) > 500
  start += 1
end

puts triangle_generator(start)
