# Manages files handling in application
class FileService
  def initialize(file_reader)
    @file_reader = file_reader
  end

  def read_lines_from_file
    raise ArgumentError.new "Reader is not initialized" if @file_reader.nil?
    
    @file_reader.read
    @file_reader.lines
  end
end
