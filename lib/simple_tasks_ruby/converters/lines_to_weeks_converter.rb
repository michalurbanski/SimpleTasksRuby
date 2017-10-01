# Converts lines to weeks objects. 
# Creates multiple weeks at once - based on lines input.
class LinesToWeeksConverter
  def convert(lines)
    raise ArgumentError.new("Lines can't be empty") if ArrayModule.is_nil_or_empty?(lines)

    @lines = lines 
    weeks = Array.new

    # Convert lines to weeks hash
    # Then convert hash to weeks objects
    weeks_hash = convert_lines_to_weeks_hash(@lines) 

    # Each hash key is converted into a Week object
    weeks_hash.each do |week_name, week_lines_objects|
      @week_converter = WeekConverter.new(week_name, week_lines_objects)
      week = @week_converter.convert_lines_to_week

      weeks.push(week)
    end

    weeks
  end
    
  private

    # returns: hash 
    # key: week title
    # value: all lines for a week
    def convert_lines_to_weeks_hash(lines)
      # 'raise' without specifying exception type raises RuntimeError
      # NOTE: to_a.empty? checks if nil or empty in one statement
      if lines.to_a.empty? then raise "Lines collection to be changed to weeks is not defined" end

      # Structure
      # hash keys are weeks
      # hash values are arrays of days with actions for this week
      weeks = Hash.new
      current_week = nil

      #TODO: Can be moved later to a new class with parsing algorithm
      # Parsing algorithm
      lines.each do |line|
        if WeeksParser.is_line_with_week(line.data) 
          current_week = line.data
          weeks[current_week] = Array.new
        else
          next if current_week.nil? # if any week hasn't been found yet then continue until any found

          weeks[current_week].push line # TODO: in this way week contains mixed days with actions, so in fact week still has lines
        end
      end

      weeks # weeks hash, key: week title, value: all lines for the week
    end
end
