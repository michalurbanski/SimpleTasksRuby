require 'spec_helper' 

module SimpleTasksRuby
  describe FileService do 
    describe "Reads lines from file" do 
      it "When reader is not initialized then exception is thrown" do 
        @file_service = FileService.new(nil)
        
        lambda {@file_service.read_lines_from_file}.must_raise ArgumentError
      end

      it "When path is not empty then returns lines" do 
        data = Array.new
        file_reader = mock()
        file_reader.expects(:read)
        file_reader.expects(:lines).returns(data)
        @file_service = FileService.new(file_reader)

        lines = @file_service.read_lines_from_file
        
        lines.wont_be_nil
        lines.length.must_equal data.length
      end
    end
  end
end
