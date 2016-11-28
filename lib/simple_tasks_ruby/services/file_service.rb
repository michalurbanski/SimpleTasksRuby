# Manages files handling in application
class FileService
  def initialize(writer)
    @writer = writer #TODO: currently not used. Should this class print results itself?
  end

  def get_lines_from_file(path)
    reader = FileSystemDataReader.new({
          :path => path
        })

    reader.read
    @file_lines = reader.lines
  end
end
