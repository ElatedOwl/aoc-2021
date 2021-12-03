days = []

Dir.glob('*/*.rb') do |filename|
  match = filename.match(%r{^(?<day>[1-9]|[1-9][0-9]\b)/day\k<day>.*\.rb$})
  next if match.nil?

  require "./#{filename}"
  days << Object.const_get("Day#{match['day']}").new
end

most_recent_solution = days.last
puts "Executing #{most_recent_solution.class.name} https://adventofcode.com/2021/day/#{days.size}"
puts most_recent_solution.run_day