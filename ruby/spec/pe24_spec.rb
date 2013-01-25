require_relative '../lib/pe24'

describe Permutator do

  let(:p) { Permutator.new }

  it "generates lexical permutations" do
    p.permutations(0,1,2).should ==
      %w(012 021 102 120 201 210)
  end

  it "finds the damn solution" do
    p.permutations(0,1,2,3,4,5,6,7,8,9)[1_000_000].should ==
      "2783915460"
  end

end
