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
    daysCounter = 0

    possibleDaysTester = PossibleDaysTester.new

    @lines.each do |line|
      if @weekName.empty? then
        extract_week_name(line)
        next
      end

      if(possibleDaysTester.is_day(line))
        puts("New day #{line}")
        day = Day.new(line)
        @days.push(day)
        next
      end

      if is_end_of_day(line)
        puts("End of day #{daysCounter}")
        daysCounter += 1
        next
      end

      puts("Action for a given day #{line}")
      # actions for a given day
      day = @days[daysCounter] #TODO: this is nil because there's a blank line after week name - should be fixed at first
      day.add_action(line)

      # TODO: continue parsing other lines
      # Find day name
      # Take actions as long as new line is encountered

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

    def is_end_of_day(line)
      if line =~ /^\n/
        return true
      end

      return false
    end
end
