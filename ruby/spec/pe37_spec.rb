require_relative '../lib/pe37'

describe "problem thirty seven" do

  it "3797 is a truncatable prime" do
    truncatable?(3797).should be_true
  end

  it "11 is not" do
    truncatable?(11).should be_false
  end

  it "811 is not" do
    truncatable?(811).should be_false
  end

end
