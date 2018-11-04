# Determines if line is a week line
module WeeksParser
  def self.is_line_with_week(line)
    raise ArgumentError.new("Only string can be correctly parsed") unless line.is_a? String

    # Line is a week indication when it has:
    # - "Week" word (case-insensitive)
    # - One or more digits after Week
    # Examples: Week 1, Week 42, week 50

    pattern = /^Week\s\d+\s*/i
    line =~ pattern ? true : false
  end
end
