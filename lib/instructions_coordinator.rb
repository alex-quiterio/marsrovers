class InstructionsCoordinator

 ORIENTATION_STATES = {
  [:N, :R] => :E,
  [:N, :L] => :W,
  [:S, :R] => :W,
  [:S, :L] => :E,
  [:E, :R] => :S,
  [:E, :L] => :N,
  [:W, :R] => :N,
  [:W, :L] => :S
 }.freeze

 MOVE_COORDS = {
  :N => [:y, 1],
  :S => [:y, -1],
  :E => [:x, 1],
  :W => [:x, -1]
 }.freeze

 def move(obj, command)
  if is_forward_command?(command)
   update_position(obj)
  else
   rotate(obj, command)
  end
 end

 private

 def is_forward_command?(command)
  :M == command
 end

 def update_position(obj)
  axis, multiplier = get_move_coordinates(obj.orientation)
  obj.position[axis] = obj.position[axis] + multiplier
 end

 def rotate(obj, command)
  obj.orientation = calculate_new_orientation(obj.orientation, command)
 end

 def calculate_new_orientation(current_orientation, rotation)
  move_tuple = [current_orientation, rotation]
  return ORIENTATION_STATES[move_tuple]
 end

 def get_move_coordinates(orientation)
  MOVE_COORDS[orientation]
 end

end
