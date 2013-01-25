class ProblemTwentyThree
  LIMIT = 28123

  def abundant? n
    divisors(n).inject(0,&:+) > n
  end

  def divisors n
    (1..n/2).select { |num| n % num == 0 }
  end

  def abundant_numbers limit = LIMIT
    (1..limit).select { |n| abundant?(n) }
  end

  def sum_of_abundant range
    sums, numbers = [], range.select { |x| abundant?(x) }
    while numbers.any?
      first = numbers.shift
      sums << first + first
      numbers.each { |n| sums << first + n }
    end
    sums.select { |n| n <= range.max }
  end
end

def problem_twenty_three
  p = ProblemTwentyThree.new
  rejects = p.sum_of_abundant(1..28123)
  ((1..28123).to_a - rejects).inject(0,&:+)
end

time = Time.now
#puts "Solved: #{problem_twenty_three} in #{Time.now - time} seconds"
