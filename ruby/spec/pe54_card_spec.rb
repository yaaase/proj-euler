require_relative '../lib/pe54_card'

describe Card do

  it "knows its rank" do
    ace = Card.new "A", "S"
    ace.rank.should == 14
  end

  it "knows its suit" do
    ace = Card.new "A", "S"
    ace.suit.should == :spade
  end

  it "can be equal to another card" do
    ace = Card.new "A", "S"
    ace_two = Card.new "A", "S"
    ace.should == ace_two
  end

  it "can be unequal" do
    ace = Card.new "A", "S"
    king = Card.new "K", "S"
    ace.should_not == king
  end

end
