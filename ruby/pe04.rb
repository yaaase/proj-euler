s = 0
100.upto(999) { |a|
  100.upto(999) { |b|
    n = a*b
    s = n if n.to_s.reverse.to_i == n and n > s
  }
}
puts s
