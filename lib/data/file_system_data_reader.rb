class FileSystemDataReader
  attr_reader :lines

  def initialize(path = nil)
    @path = path || default_path
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

  def default_path
    nil
  end
end
