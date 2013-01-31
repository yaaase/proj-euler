def concat_pandig?(num, mults)
  sum = mults.inject("") do |s, a|
    s + (a * num).to_s
  end
  return sum.to_i if pandigital?(sum.to_i)
  return false
end

def pandigital?(n)
  n.to_s.split("").map(&:to_i).sort == [1,2,3,4,5,6,7,8,9]
end

best = 0
time = Time.now

1.upto(13) do |limit|
  1.upto(9999) do |candidate|
    try = concat_pandig?(candidate, (1..limit).to_a) || 0
    best = try if try > best
  end
end

puts "Solved: #{best} in #{Time.now - time} seconds."
