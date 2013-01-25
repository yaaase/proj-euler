require_relative '../lib/pe30'

describe ProblemThirty do

  let(:p) { ProblemThirty.new }

  it "1634 is the sum of the 4th power of its digits" do
    p.sum_of_power_of_digits?(1634, 4).should be_true
  end

  it "1234 is not the sum of the 4th power of its digits" do
    p.sum_of_power_of_digits?(1234, 4).should be_false
  end

  it "sum of all for 4th power is 19316" do
    p.sum_of_all_for_power(4).should == 19316
  end

  it "solution is 443839" do
    p.sum_of_all_for_power(5).should == 443839
  end
end
