require_relative '../FileHandling/file_reader'

module TestDataModule
  def TestDataModule.read_data
    file_relative_path = "../../Samples/test.txt"
    absolute_path = File.expand_path(file_relative_path, __FILE__)

    fileReader = FileReader.new(absolute_path)
    fileReader.read_file

    fileReader.lines
  end
end
