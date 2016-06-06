class Main
  def start
    puts("Welcome to Simple Tasks Project")
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def read_from_file
    file_relative_path = "/Samples/realData.txt"
    path = File.join(File.dirname(__FILE__), file_relative_path)  # Directory of current file is stored in __FILE__

    fileReader = FileReader.new(path)
    fileReader.read_file

    puts("Printing file content".colorize(:green))
    #p(fileReader.lines) # lines are in the array

    fileReader.lines.each do |line|
      p(line)
    end

    @fileLines = fileReader.lines
  end

  def convert_fileLines_to_objects
    # TODO: assumption that input file has only one week - this will be changed later
    @weekConverter = WeekConverter.new(@fileLines)
    @weekConverter.convert_lines_to_week

    puts("Printing week for test purposes...")
    @weekConverter.print_week
  end

  def end
    puts("Program execution finished".colorize(:green))
  end
end
