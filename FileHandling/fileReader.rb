class FileReader
  def initialize(filePath)
    @filePath = filePath
  end

  def read_file
    print_progress("Reading file #{@filePath}")

    @lines = IO.readlines(@filePath)

    print_progress("Reading file finished")
    @lines
  end

  def print_progress(message)
    puts message
  end
end
