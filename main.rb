require_relative "Data/production_data"

class Main
  def start
    puts("Welcome to Simple Tasks Project")
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def read_from_file
    data = ProductionData.new
    @file_lines = data.read_data

    puts("Printing file content".colorize(:green))
    #p(fileReader.lines) # lines are in the array

    @file_lines.each do |line|
      p(line)
    end
  end

  def convert_fileLines_to_objects
    # TODO: assumption that input file has only one week - this will be changed later
    @week_converter = WeekConverter.new(@file_lines)
    @week_converter.convert_lines_to_week

    puts("Printing week for test purposes...")
    @week_converter.print_week
  end

  def end
    puts("Program execution finished".colorize(:green))
  end
end
