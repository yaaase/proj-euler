puts (1..20).inject(1){|n,i|n*=(i/n.gcd(i))}
