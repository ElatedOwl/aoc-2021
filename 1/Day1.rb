class Day1
  def initialize(input_file = 'input.txt')
    @input_file = input_file
  end

  def run_day
    count_depth_increases
  end

  private

  def load_depth_from_input_file(&block)
    File.foreach(@input_file, &block)
  end

  def count_depth_increases
    i = 0
    load_depth_from_input_file do |depth|
      exit if i > 20
      puts depth
      i += 1
    end
  end
  # Read file into array
  # Find amount of items that increase compared to previous element
end

if __FILE__ == $PROGRAM_NAME
  day = Day1.new
  day.run_day
end