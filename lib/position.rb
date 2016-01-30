class Position < Struct.new(:x, :y)
 def to_s
  [x, y].join(' ')
 end

 def to_a
  [x, y]
 end
end
