require 'spec_helper'

describe DataReader do
  before do
    @data_reader = DataReader.new
  end

  describe ".read_data" do
    it "not initialized data reader raises exception when trying to read the data" do
      lambda { @data_reader.read }.must_raise NoMethodError
    end

    it "not initialized data reader has not initialized lines" do
      @data_reader.lines.must_be_nil
    end

    it "initialized with reader reads lines" do 
      
      # refute(true) # allows to fail test 
    end
  end
end
