require 'spec_helper' 

describe ConfigurationService do 
  describe 'Positive cases' do 
    it "returns path to file with data for processing when entry exists" do 
      configuration_service = mock()
      configuration_service.expects(:read_value).with(any_of(:input_file_path)).returns("correct path") 
      
      input_file_path = configuration_service.read_value(:input_file_path)

      input_file_path.wont_be_nil 
      input_file_path.must_equal "correct path" 
    end
  end 

  describe 'Negative cases' do 
    it "returns nil when configuration value is not found" do 
      configuration_service = ConfigurationService.new
      
      missing_value = configuration_service.read_value(:missing_value) 

      missing_value.must_be_nil
    end
  end
end
