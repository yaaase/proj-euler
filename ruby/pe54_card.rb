class Card
  attr_reader :rank, :suit

  CARD_RANKS = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  SUITS = {
    "S" => :spade,
    "H" => :heart,
    "D" => :diamond,
    "C" => :club
  }

  def initialize rank, suit
    @rank, @suit = CARD_RANKS[rank], SUITS[suit]
  end

  def == other
    @rank == other.rank && @suit == other.suit
  end
end
