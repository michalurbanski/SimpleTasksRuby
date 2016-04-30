require_relative '../Models/possible_days_tester'
require_relative '../Models/day'
require_relative 'lines_converter'

class WeekConverter
  attr_reader :week

  def initialize(lines)
    @lines = lines # all lines as input

    linesConverter = LinesConverter.new(@lines)
    @lines = linesConverter.remove_blank_lines
  end

  # Returns week object based on raw input
  def convert_lines_to_week
    @week = Week.new
    @week_name = ""
    possibleDaysTester = PossibleDaysTester.new

    # Stores days in hash, values are arrays of actions
    @all_days = Hash.new

    # Input collection has no empty lines at this moment
    @lines.each do |line|
      if @week_name.empty? then
        extract_week_name(line)
        @week.name = @week_name
        next
      end

      if(possibleDaysTester.is_day(line))
        day = Day.new(line) #TODO - name of day needs to be fixed - it's not full line
        @week.add_day(day) #TODO - adding days need to be fixed
        next
      end

      if(WeekConverter.is_end_of_week(line))
        return
      end

      # Not a week line and not a day line - this means that we're parsing actions now
      if !day.nil? then
        day.add_action(line)
        next
      end
    end

    return @week
  end

  def parse_week
    day_name = nil
    all_days = Hash.new
    @week_name = ""
    @week = Week.new
    possibleDaysTester = PossibleDaysTester.new

    @lines.each do |line|
      if @week_name.empty? then
        extract_week_name(line)
        @week.name = @week_name
        next
      end

      if(possibleDaysTester.is_day(line))
        all_days[line] = Array.new
        day_name = line
        next
      end

      if(WeekConverter.is_end_of_week(line))
        return all_days
      end

      if !day_name.nil? then
        all_days[day_name].push(line)
        next
      end
    end

    # If value wasn't returned from method earlier this means that
    # there's no end of week sign in content and we return content as is
    # in this case
    return all_days
  end

  def print_week
    puts(@week.name)
    @week.days.each do |day|
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
