class Day1
  # Read file into array
  # Find amount of items that increase compared to previous element
  def initialize(input_file = './1/input.txt')
    @input_file = input_file
  end

  def run_day
    puts "Part 1 #{count_depth_increases}"
    puts "Part 2 #{count_depth_increases(3)}"
  end

  private

  def load_depth_from_input_file
    File.foreach(@input_file) do |line|
      yield Integer(line, 10)
    end
  end

  def count_depth_increases(window_size = 1)
    depth_set = []
    depth_increases = 0

    load_depth_from_input_file do |depth|
      depth_set << depth
      next if depth_set.size < window_size + 1

      depth_increases += 1 if depth_increase?(depth_set, window_size)
      depth_set.shift
    end

    depth_increases
  end

  def depth_increase?(depth_set, window_size)
    window_one = depth_set.take(window_size).sum
    window_two = depth_set.drop(1).sum
    window_two > window_one
  end
end

if __FILE__ == $PROGRAM_NAME
  day = Day1.new
  day.run_day
end
