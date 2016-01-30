require_relative './lib/rover'
require_relative './lib/plateau'
require_relative './lib/instructions_coordinator'

class FileReader

 def initialize(file_name)
  fail unless File.exists?(file_name)
  @file = File.open(file_name)
 end

 def read_spaced_line
  get_chars(@file.readline.strip)
 end

 def read_line
  @file.readline.strip.chars
 end

 def is_done?
  @file.eof?
 end

 private

 def get_chars(line)
  line.split(/\s+/)
 end
end

def create_rover(x, y, orientation)
  Rover.new(Position.new(x, y), orientation.intern)
end

file_reader = FileReader.new(ARGV[0])
x, y = file_reader.read_spaced_line
plateau = Plateau.new(x.to_i, y.to_i)
coordinator = InstructionsCoordinator.new

while !file_reader.is_done?
 x, y, orientation = file_reader.read_spaced_line
 rover = create_rover(x.to_i, y.to_i, orientation)
 rover_moves = file_reader.read_line.map(&:intern)
 rover_moves.each do |move|
  if plateau.within_boundaries?(rover.position)
   coordinator.move(rover, move)
  end
 end
 puts rover
end
