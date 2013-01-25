def divisor_sum(n)
  (1..n/2).select{|v|n%v==0}.inject(0,&:+)
end

amicable = (2..9999).select do |n|
  sum = divisor_sum(n)
  sum != n and n == divisor_sum(sum)
end

#puts amicable.inject(0,&:+)
