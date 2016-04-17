require_relative '../Models/possible_days_tester'
require_relative '../Models/day'
require_relative 'lines_converter'

class WeekConverter
  attr_reader :days

  def initialize(lines)
    @lines = lines # all lines as input

    linesConverter = LinesConverter.new(@lines)
    @lines = linesConverter.remove_blank_lines
  end

  def convert_lines_to_week
    @week = Week.new

    @week_name = ""
    @days = Array.new
    day = nil

    possibleDaysTester = PossibleDaysTester.new

    # Input collection has no empty lines at this moment
    @lines.each do |line|
      if @week_name.empty? then
        extract_week_name(line)
        @week.name = @week_name
        next
      end

      if(possibleDaysTester.is_day(line))
        day = Day.new(line) #TODO - name of day needs to be fixed - it's not full line
        @days.push(day)
        @week.add_day(day)
        next
      end

      if(WeekConverter.is_end_of_week(line))
        return
      end

      # Not a week line and not a day line - this means that we're parsing actions now
      if !day.nil? then day.add_action(line) end
    end

    return @week
  end

  def print_week
    puts(@week_name)
    @days.each do |day|
      day.print_day
    end
  end

  private
    def extract_week_name(line)
      week_name_pattern = /^[Ww]eek/

      if line =~ week_name_pattern
        @week_name = line
      end
    end

    def self.is_end_of_week(line)
      # End of week has at least three hyphens - by convention
      end_of_week_pattern = /^---/

      # NOTE: !! converts to boolean - all values except of nil are true then
      return !!(line =~ end_of_week_pattern)
    end
end
