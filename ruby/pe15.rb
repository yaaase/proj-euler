def routes x
  factorial(x+x) / (factorial(x) * factorial(x))
end

def factorial x
  (1..x).inject(1,&:*)
end

time = Time.now
puts "Solved: #{routes(20)} in #{Time.now - time} seconds"
