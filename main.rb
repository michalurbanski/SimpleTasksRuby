class Main
  def start
    puts("Welcome to Simple Tasks Project")
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def read_from_file
    filePath = "Samples/first.txt"
    fileReader = FileReader.new(filePath)
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
    weekConverter = WeekConverter.new(@fileLines)
    weekConverter.convert_lines_to_week

    puts("Printing week...")
    puts(weekConverter.to_s)

  end

  def end
    puts("Program execution finished".colorize(:green))
  end
end
