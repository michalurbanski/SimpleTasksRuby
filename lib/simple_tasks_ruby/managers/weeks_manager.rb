class WeeksManager
  attr_reader :weeks

  def convert_data_to_weeks(lines) 
    return nil if lines.nil? || lines.empty?
  
    @weeks = LinesToWeeksConverter.convert(lines)
  end
end
