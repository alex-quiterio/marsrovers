class Rover
 attr_accessor :orientation, :position

 def initialize(position, orientation)
  self.position = position
  self.orientation = orientation
 end

 def to_s
  [position, orientation].join(' ')
 end

end
