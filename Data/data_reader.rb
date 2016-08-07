require_relative '../FileHandling/file_reader'

class DataReader
  attr_reader :lines

  def initialize(path)
    @path = path
  end

  def read_data
    fileReader = FileReader.new(absolute_path)
    fileReader.read_file
    @lines = fileReader.lines
  end

  private
  def absolute_path
    File.expand_path(@path, __FILE__)
  end
end
