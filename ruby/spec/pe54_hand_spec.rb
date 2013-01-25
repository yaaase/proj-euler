require_relative '../lib/pe54_hand'

describe Hand do
  CARDS = {
    "A" => "ace",
    "2" => "two",
    "3" => "three",
    "4" => "four",
    "5" => "five",
    "6" => "six",
    "7" => "seven",
    "8" => "eight",
    "9" => "nine",
    "T" => "ten",
    "J" => "jack",
    "Q" => "queen",
    "K" => "king"
  }

  before(:all) do
    %w[A 2 3 4 5 6 7 8 9 T J Q K].each do |rank|
      %w[S D C H].each do |suit|
        eval "@#{CARDS[rank]}_#{suit.downcase} = Card.new(rank, suit)"
      end
    end
  end

  it "knows one pair" do
    hand = Hand.new [@ace_s, @ace_c, @two_d, @three_d, @ten_s]
    hand.pair.should be_true
  end

  it "knows what that one pair is" do
    hand = Hand.new [@ace_s, @ace_c, @two_d, @three_d, @ten_s]
    hand.pair.should == [14]
  end

  it "knows two pair" do
    hand = Hand.new [@ace_s, @ace_c, @two_d, @ten_s, @ten_c]
    hand.two_pair.should be_true
  end

  it "knows two pair and the values associated with the pairs" do
    hand = Hand.new [@ace_s, @ace_c, @two_d, @ten_s, @ten_c]
    hand.two_pair.should == [10, 14]
  end

  it "knows three of a kind" do
    hand = Hand.new [@ace_s, @ace_c, @ace_d, @ten_s, @two_d]
    hand.three_of_a_kind.should be_true
  end

  it "knows that three of a kind is not full house" do
    hand = Hand.new [@ace_s, @ace_c, @ace_d, @ten_s, @two_d]
    hand.full_house.should be_false
  end

  it "knows four of a kind" do
    hand = Hand.new [@ace_s, @ace_c, @ace_d, @ace_h, @two_d]
    hand.four_of_a_kind.should be_true
  end

  it "knows a full house" do
    hand = Hand.new [@ace_s, @ace_c, @ace_d, @ten_s, @ten_c]
    hand.full_house.should be_true
  end

  it "returns values for full house" do
    hand = Hand.new [@ace_s, @ace_c, @ace_d, @ten_s, @ten_c]
    hand.full_house.should == [10, 14]
  end

  it "knows a flush" do
    hand = Hand.new [@ace_s, @ten_s, @two_s, @three_s, @five_s]
    hand.flush.should be_true
  end

  it "returns the values in a flush, so two flushes can be compared" do
    hand = Hand.new [@ace_s, @ten_s, @two_s, @three_s, @five_s]
    hand.flush.should == [2,3,5,10,14]
  end

  it "knows what is not a flush" do
    hand = Hand.new [@ace_d, @ten_s, @two_s, @three_s, @five_s]
    hand.flush.should be_false
  end

  it "knows a straight" do
    hand = Hand.new [@two_s, @three_s, @four_s, @five_s, @six_d]
    hand.straight.should be_true
  end

  it "knows a straight that starts with an ace" do
    hand = Hand.new [@two_s, @three_s, @four_s, @five_s, @ace_d]
    hand.straight.should be_true
  end

  it "knows what is not a straight" do
    hand = Hand.new [@two_s, @ten_s, @four_s, @five_s, @six_d]
    hand.straight.should be_false
  end

  it "knows a straight flush" do
    hand = Hand.new [@two_s, @three_s, @four_s, @five_s, @six_s]
    hand.straight_flush.should be_true
  end

  it "knows a royal flush" do
    hand = Hand.new [@ten_s, @jack_s, @queen_s, @king_s, @ace_s]
    hand.royal_flush.should be_true
  end

end
