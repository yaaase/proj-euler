require_relative '../lib/pe55'

describe "problem 55" do
  it { lychral?(47).should be_false }

  it { lychral?(349).should be_false }
end
