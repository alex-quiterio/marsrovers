require_relative './position'

class Plateau

 attr_reader :lower_left, :upper_right

 def initialize(x, y)
  @lower_left   = Position.new(0, 0)
  @upper_right  = Position.new(x, y)
 end

 def within_boundaries?(position)
  position.x >= lower_left.x && position.y >= lower_left.y &&
  position.x <= upper_right.x && position.y <= upper_right.y
 end

end
