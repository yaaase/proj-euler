require 'prime'

counter = 0
Prime.each(1_000_000) do |p|
  p = p.to_s
  set = []
  p.size.times do
    p << p.slice!(0)
    set << p.to_i
  end
  counter += 1 if !set.map(&:prime?).include?(false)
end
puts counter
