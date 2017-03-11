# Manages files handling in application
class FileService
  def initialize(writer, file_reader)
    @writer = writer #TODO: currently not used. Should this class print results itself?
    @file_reader = file_reader
  end

  def get_lines_from_file
    raise ArgumentError.new "Reader is not initialized" if @file_reader.nil?
    
    @file_reader.read # perform action 
    @file_reader.lines # get state of the object
  end
end
