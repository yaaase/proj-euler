require_relative './pe54_hand_comparator'

describe HandComparator do
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
    @hc = HandComparator.new
  end

  it "ace high beats king high" do
    hand_one = Hand.new [@ace_s, @ten_s, @jack_s, @four_s, @six_d]
    hand_two = Hand.new [@king_s, @ten_d, @two_s, @three_s, @jack_d]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "AJT82 > AT982 (responds to kicker)" do
    hand_one = Hand.new [@ace_s, @ten_s, @jack_s, @eight_c, @two_s]
    hand_two = Hand.new [@ace_c, @ten_d, @two_d, @nine_c, @eight_d]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "one pair beats high card" do
    hand_one = Hand.new [@ace_s, @ace_d, @jack_s, @four_s, @six_d]
    hand_two = Hand.new [@king_s, @ten_d, @two_s, @three_s, @jack_d]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "a pair of tens beats a pair of twos" do
    hand_one = Hand.new [@ace_s, @ten_s, @ten_d, @jack_s, @three_s]
    hand_two = Hand.new [@ace_d, @two_s, @two_d, @jack_d, @king_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "a pair of tens ace high beats a pair of tens king high" do
    hand_one = Hand.new [@ace_s, @ten_s, @ten_d, @jack_s, @three_s]
    hand_two = Hand.new [@queen_s, @ten_h, @ten_c, @jack_d, @king_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "TT33 > TT22" do
    hand_one = Hand.new [@ace_s, @ten_s, @ten_d, @three_d, @three_s]
    hand_two = Hand.new [@queen_s, @ten_h, @ten_c, @two_d, @two_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "TT22A > TT22K" do
    hand_one = Hand.new [@ace_s, @ten_s, @ten_d, @two_h, @two_c]
    hand_two = Hand.new [@king_s, @ten_h, @ten_c, @two_d, @two_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "three aces beats three twos" do
    hand_one = Hand.new [@ace_s, @ace_d, @ace_h, @ten_d, @jack_s]
    hand_two = Hand.new [@two_s, @two_d, @two_h, @king_s, @queen_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "in a straight the high card wins" do
    hand_one = Hand.new [@two_s, @three_s, @four_s, @five_s, @six_d]
    hand_two = Hand.new [@three_d, @four_h, @five_d, @six_h, @seven_s]
    @hc.winner(hand_one, hand_two).should == hand_two
  end

  it "in a flush the high card wins" do
    hand_one = Hand.new [@two_s, @three_s, @four_s, @five_s, @seven_s]
    hand_two = Hand.new [@three_d, @four_d, @five_d, @six_d, @eight_d]
    @hc.winner(hand_one, hand_two).should == hand_two
  end

  it "in a straight flush the high card wins" do
    hand_one = Hand.new [@two_s, @three_s, @four_s, @five_s, @six_s]
    hand_two = Hand.new [@three_d, @four_d, @five_d, @six_d, @seven_d]
    @hc.winner(hand_one, hand_two).should == hand_two
  end

  it "four aces beats four kings" do
    hand_one = Hand.new [@ace_s, @ace_d, @ace_h, @ace_c, @ten_d]
    hand_two = Hand.new [@king_s, @king_d, @king_h, @king_c, @ten_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "four aces ten kicker beats four aces nine kicker" do
    hand_one = Hand.new [@ace_s, @ace_d, @ace_h, @ace_c, @ten_d]
    hand_two = Hand.new [@ace_s, @ace_d, @ace_h, @ace_c, @nine_s]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "fives over twos beats threes over twos" do
    hand_one = Hand.new [@five_s, @five_d, @five_c, @two_s, @two_c]
    hand_two = Hand.new [@three_s, @three_d, @three_h, @two_d, @two_h]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "fives over twos beats twos over fives" do
    hand_one = Hand.new [@five_s, @five_d, @five_c, @two_s, @two_c]
    hand_two = Hand.new [@two_s, @two_d, @two_h, @five_s, @five_d]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "fives over threes beats fives over twos" do
    hand_one = Hand.new [@five_s, @five_d, @five_c, @three_s, @three_d]
    hand_two = Hand.new [@five_s, @five_d, @five_c, @two_s, @two_c]
    @hc.winner(hand_one, hand_two).should == hand_one
  end

  it "a royal flush beats a full house" do
    hand_one = Hand.new [@ten_c, @ten_d, @six_c, @six_s, @six_d]
    hand_two = Hand.new [@ace_s, @king_s, @jack_s, @queen_s, @ten_s]
    @hc.winner(hand_one, hand_two).should == hand_two
  end

end
