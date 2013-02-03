sum = 0
time = Time.now

1.upto(99) do |a|
  2.upto(99) do |b|
    digit_sum = (a**b).to_s.split('').map(&:to_i).inject(0,&:+)
    sum = digit_sum if digit_sum > sum
  end
end

puts "Solved: #{sum} in #{Time.now - time} seconds."
