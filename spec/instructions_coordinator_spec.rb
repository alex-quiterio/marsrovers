require 'ostruct'
require "minitest/autorun"

require_relative '../lib/instructions_coordinator'

class Explorer
 attr_accessor :orientation, :position

 def initialize(x, y, orientation)
  self.position = OpenStruct.new(x: x, y: y)
  self.orientation = orientation
 end
end


class TestInstructionsCoordinator < Minitest::Test

  def setup
    @coordinator = InstructionsCoordinator.new
  end

  # Basic Moves
  #
  def test_move_north
    explorer = Explorer.new(1,2, :N)
    @coordinator.move(explorer, :M)
    assert_equal 3, explorer.position.y
  end

  def test_move_south
    explorer = Explorer.new(1,2, :S)
    @coordinator.move(explorer, :M)
    @coordinator.move(explorer, :M)
    assert_equal 0, explorer.position.y
  end

  def test_move_east
    explorer = Explorer.new(1,2, :E)
    @coordinator.move(explorer, :M)
    assert_equal 2, explorer.position.x
  end

  def test_move_west
    explorer = Explorer.new(2,2, :W)
    @coordinator.move(explorer, :M)
    assert_equal 1, explorer.position.x
  end

  # Rotations
  #
  # With North as Initial Orienation
  def test_rotate_north_to_left
    explorer = Explorer.new(1,2, :N)
    @coordinator.move(explorer, :L)
    assert_equal :W, explorer.orientation
  end

  def test_rotate_north_to_right
    explorer = Explorer.new(1,2, :N)
    @coordinator.move(explorer, :R)
    assert_equal :E, explorer.orientation
  end

  # With South as Initial Orienation
  def test_rotate_south_to_right
    explorer = Explorer.new(1,2, :S)
    @coordinator.move(explorer, :R)
    assert_equal :W, explorer.orientation
  end

  def test_rotate_south_to_left
    explorer = Explorer.new(1,2, :S)
    @coordinator.move(explorer, :L)
    assert_equal :E, explorer.orientation
  end

  # With East as Initial Orienation
  def test_rotate_east_to_right
    explorer = Explorer.new(1,2, :E)
    @coordinator.move(explorer, :L)
    assert_equal :N, explorer.orientation
  end

  def test_rotate_east_to_left
    explorer = Explorer.new(1,2, :E)
    @coordinator.move(explorer, :R)
    assert_equal :S, explorer.orientation
  end

  # With West as Initial Orienation
  def test_rotate_west_to_right
    explorer = Explorer.new(1,2, :W)
    @coordinator.move(explorer, :L)
    assert_equal :S, explorer.orientation
  end

  def test_rotate_west_to_left
    explorer = Explorer.new(1,2, :W)
    @coordinator.move(explorer, :R)
    assert_equal :N, explorer.orientation
  end

end
