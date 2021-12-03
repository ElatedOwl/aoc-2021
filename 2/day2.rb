class Day2 < Day
  class Position
    attr_accessor :horizontal, :depth

    def initialize(horizontal = 0, depth = 0)
      @horizontal = horizontal
      @depth = depth
    end
  end

  def run_day
    position = Position.new
    load_test_file do |line|
      direction, distance = line.split(/ /, 2)
      distance = Integer(distance.strip, 10)
      move(direction, distance, position)
    end

    puts "Part 1 #{position.horizontal * position.depth}"
  end

  def move(direction, distance, position)
    case direction
    when 'forward'
      position.horizontal += distance
    when 'up'
      position.depth -= distance
    when 'down'
      position.depth += distance
    end
  end
end
