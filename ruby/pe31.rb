class ProblemThirtyOne
  COINS = [1, 2, 5, 10, 20, 50, 100, 200]

  def combinations_for(value)
    recursive_combinations(value, COINS.size - 1)
  end

  def recursive_combinations(value, index)
    return 1 if index == 0
    (0..(value/COINS[index])).inject(0) do |sum, acc|
      sum + recursive_combinations(value - acc*COINS[index], index-1)
    end
  end
end

time, p = Time.now, ProblemThirtyOne.new
puts "Solved: #{p.combinations_for(200)} in #{Time.now - time} seconds."
