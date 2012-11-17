require_relative './pe23'

describe ProblemTwentyThree do
  before(:each) { @p = ProblemTwentyThree.new }

  it { @p.abundant?(9).should be_false }

  it { @p.abundant?(12).should be_true }

  it { @p.abundant_numbers(12).should == [12] }

  it { @p.abundant_numbers(13).should == [12] }

  it { @p.sum_of_abundant(1..25).should == [24] }
end
