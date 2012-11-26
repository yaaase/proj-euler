require_relative './pe54_hand_comparator'

class ProblemFiftyFour
  def initialize
    @hc = HandComparator.new
  end

  def winner hand_one, hand_two
    first_hand, second_hand = parse_hands(hand_one, hand_two)
    winner = @hc.winner(first_hand, second_hand)
    return (winner == first_hand) ? :one : :two
  end

  def solve
    score = 0
    file = File.open("./poker.txt","r")
    while line = file.gets
      hand_one = line.split(" ")[0..4]
      hand_two = line.split(" ")[5..9]
      score += 1 if winner(hand_one, hand_two) == :one
    end
    score
  end

  private

  def parse_hands hand_one, hand_two
    one, two = [], []

    hand_one.each do |string|
      one << parse_card(string)
    end
    hand_two.each do |string|
      two << parse_card(string)
    end

    [Hand.new(one), Hand.new(two)]
  end

  def parse_card string
    rank, suit = string.split(//)
    Card.new(rank, suit)
  end

end

time = Time.now
puts "Solved: #{ProblemFiftyFour.new.solve} in #{Time.now - time} seconds."
