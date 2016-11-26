# Reads from file system
class FileSystemDataReader < DataReader
  attr_reader :lines

  def post_initialize(args)
    @reader = FileReader.new args[:path]
  end
end
