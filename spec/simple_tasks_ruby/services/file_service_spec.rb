require 'spec_helper' 

describe FileService do 
  describe "Reads lines from file" do 
    it "When path is empty then raises exception" do 
      writer = mock()
      @file_service = FileService.new(writer)
      
      lambda {@file_service.get_lines_from_file(nil)}.must_raise ArgumentError
    end

    it "When path is not empty then returns lines" do 
      writer = mock() 
      @file_service = FileService.new(writer)

      lines = @file_service.get_lines_from_file("valid path")
      
      lines.wont_be_nil
    end
  end
end
