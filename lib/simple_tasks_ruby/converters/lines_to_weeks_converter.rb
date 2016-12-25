# Converts raw lines to days objects
class LinesToWeeksConverter
  class << self
    def convert(lines)
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
        if WeeksParser.is_line_with_week line
          current_week = line
          weeks[current_week] = Array.new # TODO: Assumption is that lines start with week statement so this object is always initialized here correctly
        else
          weeks[current_week].push line
        end
      end

      weeks # weeks with days which have actions
    end
  end
end
