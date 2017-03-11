require 'spec_helper' 

describe FileService do 
  describe "Reads lines from file" do 
    it "When reader is not initialized then exception is thrown" do 
      writer = mock()
      @file_service = FileService.new(writer, nil)
      
      lambda {@file_service.get_lines_from_file}.must_raise ArgumentError
    end

    it "When path is not empty then returns lines" do 
      writer = mock() 
      file_reader = mock()
      file_reader.expects(:read)
      file_reader.expects(:lines).returns(Array.new())
      @file_service = FileService.new(writer, file_reader)

      lines = @file_service.get_lines_from_file
      
      lines.wont_be_nil
    end
  end
end
