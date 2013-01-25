require_relative '../lib/pe31'

describe ProblemThirtyOne do

  let(:p) { ProblemThirtyOne.new }

  it "there are 2 possible combinations to make 2 pence" do
    p.combinations_for(2).should == 2
  end

  it "there are 4 possible combinations to make 5 pence" do
    p.combinations_for(5).should == 4
  end

  it "there are 11 possible combinations to make 10 pence" do
    p.combinations_for(10).should == 11
  end

end
