class Permutator

  def permutations *numbers
    numbers.permutation.map(&:join).sort
  end

end

time = Time.now
#puts "Solved: #{Permutator.new.permutations(0,1,2,3,4,5,6,7,8,9)[1_000_000]} in #{Time.now - time} seconds."
