require_relative 'data_reader'

class TestData < DataReader
  def default_path
    "../../Samples/test.txt"
  end
end
