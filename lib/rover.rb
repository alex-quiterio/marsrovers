require 'forwardable'

class Rover
 extend Forwardable
 attr_accessor :orientation, :position
 def_delegator :position, :x, :y

 def initialize(position, orientation)
  self.position = position
  self.orientation = orientation
 end

 def to_s
  [position, orientation].join(' ')
 end

end
