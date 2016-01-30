require "minitest/autorun"

require_relative '../lib/position'

class TestPosition < Minitest::Test
  def setup
    @position = Position.new(3, 4)
  end

  def test_output_format
    assert_equal "3 4", @position.to_s
  end

end
