class NumberWordHash
  HASH = {
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
    100  => "hundred",
    1000 => "thousand"
  }

  def self.[] x
    if HASH.keys.include?(x)
      HASH[x]
    else
      build_word x
    end
  end

  def self.build_word x
    digits, word = x.to_s.split(//).map(&:to_i), ""
    place = 0
    while digits.any? do
      case place
        when 0 then word = word + HASH[digits.pop]
        when 1 then word = HASH[(digits.pop.to_s + "0").to_i] + " " + word
      end
      place += 1
    end
    word
  end
end
