require_relative '../Models/possible_days_tester'
require_relative '../Models/day'
require_relative 'linesConverter'

class WeekConverter
  def initialize(lines)
    @lines = lines # all lines as input

    linesConverter = LinesConverter.new(@lines)
    @lines = linesConverter.remove_blank_lines
  end

  def convert_lines_to_week
    @weekName = ""
    @days = Array.new
    day = nil

    possibleDaysTester = PossibleDaysTester.new

    # Input collection has no empty lines at this moment
    @lines.each do |line|
      if @weekName.empty? then
        extract_week_name(line)
        next
      end

      if(possibleDaysTester.is_day(line))
        puts("New day: #{line}")
        day = Day.new(line)
        @days.push(day)
        next
      end

      if(WeekConverter.is_end_of_week(line))
        return
      end

      # Not a week line and not a day line - this means that we're parsing actions now
      if !day.nil? then day.add_action(line) end
    end
  end

  # overriden
  def to_s
    puts(@weekName)
    @days.each do |day|
      puts(day)
    end
  end

  private
    def extract_week_name(line)
      week_name_pattern = /^[Ww]eek/

      if line =~ week_name_pattern
        @weekName = line
      end
    end

    def self.is_end_of_week(line)
      # End of week has at least three hyphens - by convention
      end_of_week_pattern = /^---/

      # NOTE: !! converts to boolean - all values except of nil are true then
      return !!(line =~ end_of_week_pattern)
    end
end
