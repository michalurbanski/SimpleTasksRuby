require_relative 'data_reader'

class TestData < DataReader
  def initialize
    super("../../Samples/test.txt")
  end
end
