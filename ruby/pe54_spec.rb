require_relative './pe54'

describe ProblemFiftyFour do
  before(:all) { @p = ProblemFiftyFour.new }

  it "high card wins" do
    @p.winner(%w[AS, 7C, 5D, KH, 2D], %w[2D, 3H, TD, 8S, QC]).should == :one
  end

  it "solution is 376" do
    @p.solve.should == 376
  end

end
