class WeeksManager
  attr_reader :weeks
  
  def initialize
    @lines_to_weeks_converter = LinesToWeeksConverter.new
  end

  def convert_data_to_weeks(lines_from_all_weeks) 
    return nil if ArrayModule.is_nil_or_empty?(lines_from_all_weeks)
  
    @weeks = @lines_to_weeks_converter.convert(lines_from_all_weeks)
  end
end
