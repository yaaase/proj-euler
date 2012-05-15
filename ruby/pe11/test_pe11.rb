require "./pe11"
require "test/unit"

class Pe11Test < Test::Unit::TestCase

  def test_can_find_largest_horizontal_product
    p = Pe11.new
    assert_equal(9, p.horiz(2))
  end

  def test_can_find_largest_vertical_product
    p = Pe11.new
    assert_equal(9, p.vert(2))
  end

  def test_can_find_three_largest_horiz
    p = Pe11.new
    assert_equal(18, p.horiz(3))
  end

  def test_can_find_three_largest_vert
    p = Pe11.new
    assert_equal(18, p.vert(3))
  end

  def test_can_grab_arrays_of_right_diags
    p = Pe11.new
    p.gen_r_diags
    assert_equal([1,1,2,2], p.r_diags[0])
  end

end
