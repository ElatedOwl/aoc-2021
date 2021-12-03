class Day
  def initialize(input_file = "2/input.txt")
    @input_file = input_file
  end

  def run_day
    puts 'run_day not implemented'
  end

  private

  def load_test_file(&block)
    File.foreach(@input_file, &block)
  end
end
