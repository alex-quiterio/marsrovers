require "minitest/autorun"

require_relative '../lib/rover'

class FakePosition < Struct.new(:x, :y)
 def to_s
  [x, y].join(' ')
 end
end

class TestRover < Minitest::Test
  def setup
    @rover = Rover.new(FakePosition.new(1, 2), :N)
  end

  def test_output_format
    assert_equal "1 2 N", @rover.to_s
  end

  # access tests

  def test_orientation_access
    assert_equal :N, @rover.orientation
  end

  def test_position_x_access
    assert_equal 1, @rover.position.x
  end

  def test_position_y_access
    assert_equal 2, @rover.position.y
  end

  # update tests

  def test_orientation_update
    @rover.orientation = :S
    assert_equal :S, @rover.orientation
  end

  def test_position_x_update
    @rover.position.x += 1
    assert_equal 2, @rover.position.x
  end

  def test_position_y_update
    @rover.position.y += 1
    assert_equal 3, @rover.position.y
  end

end
