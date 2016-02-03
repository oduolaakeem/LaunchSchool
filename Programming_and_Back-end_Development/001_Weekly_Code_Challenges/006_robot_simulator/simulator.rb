class Robot
  POSSIBLE_ORIENTATIONS = [:west, :north, :east, :south]
  attr_accessor :bearing, :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def at(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
  end

  def coordinates
    [x, y]
  end

  def orient(direction)
    valid?(direction) ? @bearing = direction : fail(ArgumentError)
  end

  def valid?(direction)
    POSSIBLE_ORIENTATIONS.include?(direction)
  end

  def turn_right
    index = POSSIBLE_ORIENTATIONS.index(bearing)
    if @bearing == POSSIBLE_ORIENTATIONS.last
      @bearing = POSSIBLE_ORIENTATIONS.first
    else
      @bearing = POSSIBLE_ORIENTATIONS[index + 1]
    end
  end

  def turn_left
    index = POSSIBLE_ORIENTATIONS.index(bearing)
    if @bearing == POSSIBLE_ORIENTATIONS.first
      @bearing = POSSIBLE_ORIENTATIONS.last
    else
      @bearing = POSSIBLE_ORIENTATIONS[index - 1]
    end
  end

  def advance
    case @bearing
    when :west
      @x -= 1
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    end
  end
end

class Simulator
  INSTRUCTIONS = {
    'R' => :turn_right,
    'L' => :turn_left,
    'A' => :advance
  }

  def initialize
  end

  def instructions(string)
    commands = []
    string.each_char { |char| commands << INSTRUCTIONS[char] }
    commands
  end

  def place(robot, position = { x: 0, y: 0, direction: :east })
    robot.at(position[:x], position[:y])
    robot.orient(position[:direction])
  end

  def evaluate(robot, string)
    instructions(string).each do |command|
      case command
      when :advance
        robot.advance
      when :turn_left
        robot.turn_left
      when :turn_right
        robot.turn_right
      end
    end
  end
end
