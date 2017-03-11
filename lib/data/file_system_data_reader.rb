# Concrete implementation of data reader for reading file system data
class FileSystemDataReader < DataReader
  def post_initialize(args)
    @reader = FileReader.new args[:path]
  end
end
