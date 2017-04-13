class TestData
  def self.single_week_path
    File.expand_path("../../samples/single_week.txt", __FILE__)
  end

  def self.multiple_weeks_path
    File.expand_path("../../samples/multiple_weeks.txt", __FILE__)
  end
end
