require_relative './pe22'

describe ProblemTwentyTwo do
  before(:each) { @p = ProblemTwentyTwo.new(["AARON","ABBEY"]) }

  context "parsing the file" do
    it "parses the names into an array" do
      @p.names.class.should == Array
    end

    it "first name is AARON" do
      @p.names.first.should == "AARON"
    end
  end

  context "scoring a letter" do
    it "a is worth 1" do
      @p.letter_score("A").should == 1
    end

    it "q is worth 17" do
      @p.letter_score("Q").should == 17
    end
  end

  context "scoring a name" do
    it "AARON is worth 49" do
      @p.name_score("AARON").should == 49
    end

    it "ABBEY is worth 35" do
      @p.name_score("ABBEY").should == 35
    end
  end

  context "scoring a name with its position" do
    it "AARON is 49 * 1, ABBEY is 35 * 2 : total is 119" do
      @p.score.should == 119
    end
  end

end
