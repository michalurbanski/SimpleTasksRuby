# Creates week object, with days and tasks for them - based on lines for this week.
# Creates only one week object - based on lines input. 
class WeekConverter
  include Logging

  def initialize(week_name, week_lines)
    # For converting lines to week, empty lines need to be removed before processing, as they are not significant 

    @week_name = week_name
    @lines = EmptyLinesRemovalModule.remove_blank_lines(week_lines)
  end

  # Returns week object (with days and actions in them) based on raw input
  def convert_lines_to_week
    possibleDaysTester = PossibleDaysTester.new
    @week = Week.new(@week_name)
    
    current_day = nil

    @lines.each do |line|
      begin
        if possibleDaysTester.is_day(line.data) 
          current_day = Day.new(line.data) 
          @week.add_day(current_day)
          next
        end

        return @week if self.class.is_end_of_week(line.data)
        
        # If not day and not end of the week then it has to be a task
        task_creator = TaskCreator.new(line.data, current_day.date)
        task = task_creator.create_task
        current_day.add_task(task)
      rescue
        logger.error("Error for line #{line}")
        raise
      end
    end

    return @week
  end

  # TODO: To be removed? 
  def print_week
    puts(@week.name)
    @week.days.each do |day|
      day.to_s
    end
  end

  private
    def self.is_end_of_week(line)
      # End of week has at least three hyphens - by convention
      end_of_week_pattern = /^---/

      # NOTE: !! converts to boolean - all values except of nil are true then
      return !!(line =~ end_of_week_pattern)
    end
end
