class ProblemFortyThree

  def substring_divisible?(n)
    str = n.to_s
    return false if str[1..3].to_i % 2  != 0
    return false if str[2..4].to_i % 3  != 0
    return false if str[3..5].to_i % 5  != 0
    return false if str[4..6].to_i % 7  != 0
    return false if str[5..7].to_i % 11 != 0
    return false if str[6..8].to_i % 13 != 0
    return false if str[7..9].to_i % 17 != 0
    return true
  end

end

time = Time.now
pandigitals = %w[0 1 2 3 4 5 6 7 8 9]
p = ProblemFortyThree.new
sum = 0

pandigitals.permutation.map(&:join).map(&:to_i).each do |perm|
  sum += perm if p.substring_divisible?(perm)
end

#puts "Solved: #{sum} in #{Time.now - time} seconds."
