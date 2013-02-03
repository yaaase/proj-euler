def nth_triangle(n)
  (n/2.0) * (n+1)
end

def word_score(word)
  score = 0
  word.downcase.split('').each do |char|
    score += (("a".."z").to_a.find_index(char) + 1)
  end
  score
end

words = nil
file = File.open('/home/mark/pe/ruby/txt/words.txt', 'r') do |f|
  while line = f.gets
    words = line.split(',').map { |w| w.gsub!(/"/, '') }
  end
end

time = Time.now
scores = words.map { |w| word_score(w) }
sum = scores.select do |score|
  (1..Float::INFINITY).take_while { |x| x <= score }.map { |x| nth_triangle(x) }.include?(score)
end.size

puts "Solved: #{sum} in #{Time.now - time} seconds."
