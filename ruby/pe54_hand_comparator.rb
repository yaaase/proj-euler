require_relative './pe54_hand'

class HandComparator
  HANDS = [
    :pair,
    :two_pair,
    :three_of_a_kind,
    :straight,
    :flush,
    :full_house,
    :four_of_a_kind,
    :straight_flush,
    :royal_flush
  ]

  def winner hand_one, hand_two
    one, two = determine_hand_ranks(hand_one, hand_two)

    if one != two # different hands, clear winner
      return one > two ? hand_one : hand_two
    elsif one == two && one != 0 # same hands
      return best HANDS[one - 1], hand_one, hand_two
    else # two high cards
      return high_card_comparison(hand_one, hand_two)
    end
  end

  private

  def best method, hand_one, hand_two
    one = hand_one.send(method).max
    two = hand_two.send(method).max

    if method == :two_pair
      best_two_pair hand_one, hand_two
    elsif method == :full_house
      best_full_house hand_one, hand_two
    elsif one == two
      high_card_comparison hand_one, hand_two
    else
      one > two ? hand_one : hand_two
    end
  end

  def best_full_house hand_one, hand_two
    one = hand_one.full_house
    two = hand_two.full_house
    if one.max == two.max
      one.min > two.min ? hand_one : hand_two
    else
      one.max > two.max ? hand_one : hand_two
    end
  end

  def best_two_pair hand_one, hand_two
    one = hand_one.two_pair
    two = hand_two.two_pair
    if one == two
      high_card_comparison hand_one, hand_two
    else
      mutual = one & two
      one -= mutual
      two -= mutual
      one.max > two.max ? hand_one : hand_two
    end
  end

  def determine_hand_ranks hand_one, hand_two
    one = two = 0
    HANDS.each_with_index do |hand, val|
      if hand_one.send(hand)
        one = (val + 1)
      end
      if hand_two.send(hand)
        two = (val + 1)
      end
    end
    [one, two]
  end

  def high_card_comparison hand_one, hand_two
    mutual = hand_one.sets_of(1) & hand_two.sets_of(1)
    one = hand_one.sets_of(1) - mutual
    two = hand_two.sets_of(1) - mutual
    one.max > two.max ? hand_one : hand_two
  end

end
