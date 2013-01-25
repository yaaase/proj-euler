class ProblemThirty

  def sum_of_power_of_digits?(number, power)
    sum = 0
    number.to_s.split("").each do |digit|
      sum += (digit.to_i ** power)
    end
    sum == number
  end

  def sum_of_all_for_power(power)
    sum = 0
    limit = ("1" + ("9" * power)).to_i
    2.upto(limit) do |num|
      sum += num if sum_of_power_of_digits?(num, power)
    end
    sum
  end

end
