require "spec_helper" 

# This test reads test data from disk
describe WeeksManager do
  before do 
    writer = mock()
    data_reader = FileSystemDataReader.new({
      :path => TestData.default_path
    })  

    file_service = FileService.new(writer, data_reader) 
    @lines = file_service.get_lines_from_file
  end

  describe "Valid cases" do 
    it "Creates weeks when input lines are not empty" do 
      weeks_manager = WeeksManager.new
      weeks_manager.convert_data_to_weeks(@lines) 

      weeks_manager.weeks.wont_be_nil 
    end 
  end 

  describe "Invalid cases" do 
    it "Weeks are nil for empty input" do 
      lines = Array.new
      weeks_manager = WeeksManager.new 
      weeks_manager.convert_data_to_weeks(lines)

      weeks_manager.weeks.must_be_nil
    end 

    it "Weeks are nil for nil input" do 
      weeks_manager = WeeksManager.new
      weeks_manager.convert_data_to_weeks(nil) 

      weeks_manager.weeks.must_be_nil
    end
  end 
end
