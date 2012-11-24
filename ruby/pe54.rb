require_relative './pe54_hand_comparator'

class ProblemFiftyFour
  def initialize
    @hc = HandComparator.new
  end

  def winner hand_one, hand_two
    one, two = [], []

    hand_one.each do |string|
      one << parse_card(string)
    end
    hand_two.each do |string|
      two << parse_card(string)
    end

    first_hand = Hand.new(one)
    second_hand = Hand.new(two)

    winner = @hc.winner(first_hand, second_hand)
    return (winner == first_hand) ? hand_one : hand_two
  end

  def parse_card string
    rank, suit = string.split(//)
    Card.new(rank, suit)
  end

  def solve
    score = 0
    file = File.open("./poker.txt","r")
    while line = file.gets
      hand_one = line.split(" ")[0..4]
      hand_two = line.split(" ")[5..9]
      score += 1 if winner(hand_one, hand_two) == hand_one
    end
    score
  end

end

time = Time.now
puts "Solved: #{ProblemFiftyFour.new.solve} in #{Time.now - time} seconds."
