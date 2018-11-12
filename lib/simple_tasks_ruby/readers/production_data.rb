module SimpleTasksRuby
  class ProductionData
    def self.get_path
      File.expand_path("../../../samples/realData.txt", __FILE__)
    end
  end
end
