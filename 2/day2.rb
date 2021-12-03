class Day2 < Day
  class Position
    attr_accessor :horizontal, :depth, :aim

    def initialize(horizontal = 0, depth = 0, aim = 0)
      @horizontal = horizontal
      @depth = depth
      @aim = aim
    end
  end

  def run_day
    puts "Part 1 #{part_one}"
    puts "Part 2 #{part_two}"
  end

  def get_instructions
    load_test_file do |line|
      direction, distance = line.split(/ /, 2)
      distance = Integer(distance.strip, 10)
      yield direction, distance
    end
  end

  def part_one
    position = Position.new
    get_instructions do |direction, distance|
      case direction
      when 'forward'
        position.horizontal += distance
      when 'up'
        position.depth -= distance
      when 'down'
        position.depth += distance
      end
    end

    position.horizontal * position.depth
  end

  def part_two
    position = Position.new
    get_instructions do |direction, distance|
      case direction
      when 'forward'
        position.horizontal += distance
        position.depth += distance * position.aim
      when 'up'
        position.aim -= distance
      when 'down'
        position.aim += distance
      end
    end

    position.horizontal * position.depth
  end
end
