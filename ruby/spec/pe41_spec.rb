require_relative '../lib/pe41'

describe Pe41 do
  it "generates all anagrams of a string" do
    Pe41.anagrams(%w[a b c]).should == %w(abc acb cba cab bac bca).sort
  end

  it "returns 4231 for 4" do
    Pe41.max_1_to_n_pandigital_prime(4).should == 4231
  end
end
