require 'spec_helper' 

describe ConfigurationService do 
  before do 
    @configuration_service = mock()
  end

  describe 'Positive cases' do 
    it "returns path to file with data for processing when entry exists" do 
      @configuration_service.stubs(:read_value).with(any_of(:input_file_path)).returns("correct path")

      input_file_path = @configuration_service.read_value(:input_file_path)

      input_file_path.must_equal "correct path" 
    end

    it "file is not read twice when reading configuration value" do 
      @configuration_service.expects(:read_value).returns("test").at_least_once
      @configuration_service.expects(:read_file).at_most(1) 

      @configuration_service.read_value(:test) 
      @configuration_service.read_value(:test)           
    end
  end 

  describe 'Negative cases' do 
    it "returns nil when configuration value is not found" do 
      @configuration_service.stubs(:read_value).with(any_of(:missing_value)).returns(nil)

      missing_value = @configuration_service.read_value(:missing_value)

      missing_value.must_be_nil
    end
  end
end
