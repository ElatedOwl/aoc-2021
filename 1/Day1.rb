class Day1
  # Read file into array
  # Find amount of items that increase compared to previous element
  def initialize(input_file = './1/input.txt')
    @input_file = input_file
  end

  def run_day
    count_depth_increases
  end

  private

  def load_depth_from_input_file
    File.foreach(@input_file) do |line|
      yield Integer(line, 10)
    end
  end

  def count_depth_increases
    previous_depth = nil
    depth_increases = 0

    load_depth_from_input_file do |depth|
      previous_depth ||= depth
      depth_increases += 1 if depth > previous_depth
      previous_depth = depth
    end

    depth_increases
  end
end

if __FILE__ == $PROGRAM_NAME
  day = Day1.new
  puts day.run_day
end
