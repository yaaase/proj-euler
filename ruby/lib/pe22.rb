class ProblemTwentyTwo
  attr_reader :names

  def initialize array
    @names = array
  end

  def letter_score letter
    LETTERS[letter.downcase]
  end

  def name_score name
    name.split(//).map(&:downcase).inject(0) do |sum, letter|
      sum + LETTERS[letter]
    end
  end

  def score
    sum = 0
    @names.each_with_index do |name, index|
      sum += (name_score(name) * (index + 1))
    end
    sum
  end

  LETTERS = {
    "a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5,
    "f" => 6, "g" => 7, "h" => 8, "i" => 9, "j" => 10,
    "k" => 11, "l" => 12, "m" => 13, "n" => 14, "o" => 15,
    "p" => 16, "q" => 17, "r" => 18, "s" => 19, "t" => 20,
    "u" => 21, "v" => 22, "w" => 23, "x" => 24, "y" => 25,
    "z" => 26
  }
end

def problem_twenty_two
  file, names = File.open('/home/mark/pe/ruby/lib/names.txt', 'r'), []
  while line = file.gets
    names = line.gsub(/"/,"").split(",").sort
  end

  ProblemTwentyTwo.new(names).score
end

time = Time.now
puts "Solved: #{problem_twenty_two} in #{Time.now - time} seconds"
