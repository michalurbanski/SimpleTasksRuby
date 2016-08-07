require_relative '../FileHandling/file_reader'

class DataReader
  def initialize(path)
    @path = path
  end

  def absolute_path
    File.expand_path(@path, __FILE__)
  end

  def read_data
    fileReader = FileReader.new(absolute_path)
    fileReader.read_file

    fileReader.lines
  end
end
