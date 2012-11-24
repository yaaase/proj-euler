require_relative './pe54_card'

describe Card do

  it "knows which value is higher" do
    ace = Card.new "A", "S"
    king = Card.new "K", "C"
    (ace > king).should be_true
  end

end
