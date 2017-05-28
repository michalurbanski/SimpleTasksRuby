module TestDataReader
  extend self 

  def read_single_week
    read_test_data(TestData.single_week_path) 
  end

  def read_multiple_weeks
    read_test_data(TestData.multiple_weeks_path)
  end  

  private 
    def read_test_data(path) 
      data_reader = FileSystemDataReader.new({
        :path => path
      })  

      file_service = FileService.new(data_reader) 
      @lines = file_service.get_lines_from_file
    end
end
