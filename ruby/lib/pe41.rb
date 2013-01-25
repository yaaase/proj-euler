require 'prime'

class Pe41
  class << self
    def max_1_to_n_pandigital_prime n
      anagrams( (1..n).map(&:to_s) ).map(&:to_i).select(&:prime?).max || 0
    end

    def anagrams array
      array.permutation.map(&:join)
    end
  end
end

time = Time.now
max = 0
1.upto(9) do |num|
  attempt = Pe41.max_1_to_n_pandigital_prime(num)
  max = attempt if attempt > max
end
#puts "Solved: #{max} in #{Time.now - time} seconds"
