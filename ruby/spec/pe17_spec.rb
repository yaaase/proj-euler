require_relative '../lib/pe17'

describe NumberWordHash do
  it { described_class[1].should == "one" }

  it { described_class[40].should == "forty" }

  it { described_class[41].should == "forty one" }

  it { described_class[99].should == "ninety nine" }

  it { described_class[101].should == "one hundred and one" }

  it { described_class[110].should == "one hundred and ten" }

  it { described_class[111].should == "one hundred and eleven" }

  it { described_class[200].should == "two hundred" }

  it { described_class[234].should == "two hundred and thirty four" }

  it { described_class[819].should == "eight hundred and nineteen" }

  it { described_class[1000].should == "one thousand" }
end
