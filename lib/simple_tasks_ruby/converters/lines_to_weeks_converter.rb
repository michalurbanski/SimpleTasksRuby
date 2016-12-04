# Converts raw lines to days objects
class LinesToWeeksConverter
  class << self
    def convert(lines)
      # TODO: should return weeks with days
      # TODO: algorithm to split lines into weeks is needed for this

      # 'raise' without specifying exception type raises RuntimeError
      if lines.nil? then raise "Lines collection to be changed to weeks is not defined" end

      weeks = Hash.new
      current_week = nil

      #TODO: Can be moved later to a new class with parsing algorithm
      lines.each do |line|
        if WeeksParser.is_line_with_week line
          current_week = line
          weeks[current_week] = Array.new # TODO: Assumption is that lines start with week statement so this object is always initialized here correctly
        else
          weeks[current_week].push line
        end
      end

      weeks
    end
  end
end
