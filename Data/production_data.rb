require_relative 'data_reader'

class ProductionData < DataReader
  def initialize
    super("../../Samples/realData.txt")
  end
end
