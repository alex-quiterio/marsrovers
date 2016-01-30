require "minitest/autorun"

require_relative '../lib/plateau'

class TestPlateau < Minitest::Test
  def setup
    @plateau = Plateau.new(5, 5)
  end

  def test_upper_right_coordinates
    assert_equal [5,5], @plateau.upper_right.to_a
  end

  def test_lower_left_coordinates
    assert_equal [0,0], @plateau.lower_left.to_a
  end

  def test_that_point_2_2_is_within_boundaries
    assert_equal true, @plateau.within_boundaries?(Position.new(2,2))
  end

  def test_that_point_0_0_is_within_boundaries
    assert_equal true, @plateau.within_boundaries?(Position.new(0,0))
  end

  def test_that_point_5_5_is_within_boundaries
    assert_equal true, @plateau.within_boundaries?(Position.new(5,5))
  end

  def test_that_point_6_5_is_not_within_boundaries
    assert_equal false, @plateau.within_boundaries?(Position.new(6,5))
  end

  def test_that_point__1__2_is_not_within_boundaries
    assert_equal false, @plateau.within_boundaries?(Position.new(-1,-2))
  end

end
