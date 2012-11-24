require_relative './pe54'

describe ProblemFiftyFour do
  before(:each) { @p = ProblemFiftyFour.new }

  it "parses cards out of strings correctly" do
    card = Card.new("A","C")
    @p.parse_card("AS").should_not == card
  end

  it "parses cards out of strings" do
    card = Card.new("A","S")
    @p.parse_card("AS").should == card
  end

  it "high card wins" do
    @p.winner(%w[AS, 7C, 5D, KH, 2D], %w[2D, 3H, TD, 8S, QC]).should == %w[AS, 7C, 5D, KH, 2D]
  end

  it "solution is 376" do
    @p.solve.should == 376
  end

end
