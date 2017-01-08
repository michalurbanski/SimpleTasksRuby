class WeekConverter
  attr_reader :week

  def initialize(lines)
    @lines = lines # all lines as input

    linesConverter = LinesConverter.new(@lines)
    @lines = linesConverter.remove_blank_lines
  end

  # Returns week object (with days and actions in them) based on raw input
  # def convert_lines_to_week
  #   all_week_days_hash = parse_week

  #   all_week_days_hash.each do |key, array|
  #     day = Day.new(key)

  #     if !array.nil? && array.length > 0
  #       array.each do |action|
  #         day.add_action(action)
  #       end
  #     end

  #     @week.add_day(day)
  #   end

  #   return @week
  # end

  # Converts lines from file to hash of days objects
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
      day.to_s
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
