# Reads from file system
class FileSystemDataReader < DataReader
  attr_reader :lines

  def post_initialize(args)
    @path = args[:path]
    @reader = FileReader.new @path
  end
end
