require "minitest/autorun"

require_relative '../lib/instructions_coordinator'

class TestInstructionsCoordinator < Minitest::Test
  def setup
    @coordinator = InstructionsCoordinator.new
  end

  def test_upper_right_coordinates
    #assert_equal [5,5], @coordinator.upper_right.to_a
  end
end
