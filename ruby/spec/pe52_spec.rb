require_relative '../lib/pe52'

describe ProblemFiftyTwo do

  it { described_class.same_digits?(125874, 2).should be_true }

  it { described_class.same_digits?(12345, 2).should be_false }

end
