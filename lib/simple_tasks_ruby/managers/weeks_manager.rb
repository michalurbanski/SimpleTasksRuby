class WeeksManager
  attr_reader :weeks
  
  def initialize
    @lines_to_weeks_converter = LinesToWeeksConverter.new
  end

  def convert_data_to_weeks(lines) 
    return nil if lines.nil? || lines.empty?
  
    @weeks = @lines_to_weeks_converter.convert(lines)
  end
end
