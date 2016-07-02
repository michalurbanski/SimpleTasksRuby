require_relative '../FileHandling/file_reader'

class DataReader
  def initialize(path)
    @path = path
  end

  def read_data
    absolute_path = File.expand_path(@path, __FILE__)

    fileReader = FileReader.new(absolute_path)
    fileReader.read_file

    fileReader.lines
  end
end
