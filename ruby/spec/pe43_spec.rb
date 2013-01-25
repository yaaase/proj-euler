require_relative '../lib/pe43'

describe ProblemFortyThree do

  let(:p) { ProblemFortyThree.new }

  it "is true for 1406357289" do
    p.substring_divisible?(1406357289).should be_true
  end


end
