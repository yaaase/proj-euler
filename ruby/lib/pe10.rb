require 'prime'

sum = 0
Prime.each(2_000_000) do |n|
  sum += n
end
#puts sum
