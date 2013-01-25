require_relative './pe54_card'

class Hand
  attr_reader :ranks, :cards

  def initialize cards
    @cards = cards
    @ranks = cards.map(&:rank).sort
    @suits = cards.map(&:suit)
  end

  def pair
    if unique_sets(1) { |num| num == 2 }
      sets_of(2)
    end
  end

  def two_pair
    if unique_sets(2) { |num| num == 2 }
      sets_of(2)
    end
  end

  def three_of_a_kind
    if unique_sets(1) { |num| num == 3 }
      sets_of(3)
    end
  end

  def straight
    return [5] if @ranks == [2,3,4,5,14]
    @ranks.each_with_index do |rank, index|
      return nil unless rank + 1 == (@ranks[index + 1] || rank + 1)
    end
    return @ranks
  end

  def flush
    if @suits.uniq.size == 1
      @ranks
    end
  end

  def full_house
    if pair && three_of_a_kind
      sets_of(2) + three_of_a_kind
    end
  end

  def four_of_a_kind
    if unique_sets(1) { |num| num == 4 }
      sets_of(4)
    end
  end

  def straight_flush
    if straight && flush
      @ranks
    end
  end

  def royal_flush
    if straight && flush && (@ranks == [10,11,12,13,14])
      @ranks
    end
  end

  def sets_of num
    {}.tap do |hash|
      @ranks.each do |rank|
        hash[rank] ||= 0
        hash[rank] += 1
      end
    end.select do |key, val|
      val == num
    end.keys
  end

  def == other
    @cards == other.cards
  end

  private

  def unique_sets size, &block
    {}.tap do |hash|
      @ranks.each do |rank|
        hash[rank] ||= 0
        hash[rank] += 1
      end
    end.values.select do |value|
      yield value
    end.size == size
  end
end
