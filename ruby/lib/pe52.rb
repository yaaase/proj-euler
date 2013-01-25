class ProblemFiftyTwo
  class << self

    def same_digits? number, power
      double = number * power
      double.to_s.split(//).sort == number.to_s.split(//).sort
    end

    def loop_to_six? number
      [6,5,4,3,2].each do |value|
        return false unless same_digits? number, value
      end
      return true
    end

    def solve
      start, solution = 1, nil
      while !solution do
        solution = start if loop_to_six? start
        start += 1
      end
      solution
    end

  end
end

time = Time.now
#puts "Solved: #{ProblemFiftyTwo.solve} in #{Time.now - time} seconds."
