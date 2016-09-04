require_relative 'data_reader'

class ProductionData < DataReader
  def default_path
    "../../Samples/realData.txt"
  end
end
