require_relative './pe17'

describe NumberWordHash do
  it { described_class[1].should == "one" }

  it { described_class[41].should == "forty one" }
end
