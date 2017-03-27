module TestDataReader
  extend self 

  def read_test_data
    data_reader = FileSystemDataReader.new({
      :path => TestData.default_path
    })  

    file_service = FileService.new(data_reader) 
    @lines = file_service.get_lines_from_file
  end  
end
