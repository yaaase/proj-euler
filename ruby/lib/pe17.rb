class NumberWordHash
  WORD_HASH = {
    1    => "one",
    2    => "two",
    3    => "three",
    4    => "four",
    5    => "five",
    6    => "six",
    7    => "seven",
    8    => "eight",
    9    => "nine",
    10   => "ten",
    11   => "eleven",
    12   => "twelve",
    13   => "thirteen",
    14   => "fourteen",
    15   => "fifteen",
    16   => "sixteen",
    17   => "seventeen",
    18   => "eighteen",
    19   => "nineteen",
    20   => "twenty",
    30   => "thirty",
    40   => "forty",
    50   => "fifty",
    60   => "sixty",
    70   => "seventy",
    80   => "eighty",
    90   => "ninety",
    100  => "one hundred",
    200  => "two hundred",
    300  => "three hundred",
    400  => "four hundred",
    500  => "five hundred",
    600  => "six hundred",
    700  => "seven hundred",
    800  => "eight hundred",
    900  => "nine hundred",
    1000 => "one thousand"
  }

  def self.[] x
    if WORD_HASH.keys.include?(x)
      WORD_HASH[x]
    else
      build_word x
    end
  end

  def self.build_word x
    digits = x.to_s.split(//).map(&:to_i)
    word, place, last_digit = "", 0, nil
    while digits.any? do
      digit = digits.pop
      if place == 0
        word = word + (WORD_HASH[digit] || "")
      elsif place == 1 && digit != 0 && digit != 1
        word = WORD_HASH[(digit.to_s + "0").to_i] + " " + word
      elsif place == 1 && digit == 1
        word = WORD_HASH[(digit.to_s + last_digit.to_s).to_i]
      elsif place == 2
        word = WORD_HASH[digit] + " hundred and " + word
      end
      last_digit = digit
      place += 1
    end
    word
  end
end

def problem_seventeen
  [].tap do |word_list|
    1.upto 1000 do |number|
      word_list << NumberWordHash[number]
    end
  end.join("").gsub(/\s/,"").split(//).size
end

time = Time.now
#puts "Solved: #{problem_seventeen} in #{Time.now - time} seconds"
