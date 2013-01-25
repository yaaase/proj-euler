def distinct_powers_to_limit n
  [].tap do |array|
    2.upto(n) do |base|
      2.upto(n) do |exponent|
        array << base**exponent
      end
    end
  end.uniq.sort
end

time = Time.now
#puts "Solved: #{distinct_powers_to_limit(100).size} in #{Time.now - time} seconds."
