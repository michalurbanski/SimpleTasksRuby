class FileReader
  attr_reader :lines

  def initialize(filePath)
    @filePath = filePath
  end

  def check_if_file_exists
    if File.exists?(@filePath) then
      if File.directory?(@filePath) then
        print_message "File #{@filePath} is a directory"
        exit
      else
        print_message "Reading file..."
      end
    else
      print_message "File #{@filePath} does not exist"
      exit
    end
  end

  def read_file
    print_message("Reading file #{@filePath}")

    check_if_file_exists
    @lines = read_lines

    print_message("Reading file finished")
  end

  def read_lines
    IO.readlines(@filePath)
  end

  def print_message(message)
    puts message
  end
end
