require_relative './pe29'

describe "problem 29" do

  it "distinct powers for 2 < a < 5 && 2 < b < 5" do
    distinct_powers_to_limit(5).should ==
      [4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125]
  end

end
