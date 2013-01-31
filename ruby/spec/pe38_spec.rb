require_relative '../lib/pe38'

describe "problem thirty eight" do

  it "123456789 is pandigital" do
    pandigital?(123456789).should be_true
  end

  it "12345678 is not" do
    pandigital?(12345678).should be_false
  end

  it "192 and [1,2,3] is pandigital" do
    concat_pandig?(192, [1,2,3]).should be_true
  end

  it "192 and [1,2,3,4] is not" do
    concat_pandig?(192, [1,2,3,4]).should be_false
  end

end
