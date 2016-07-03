require_relative "Data/production_data"
require_relative "Extractors/daily_status_extractor"
require_relative "Managers/tasks_manager"

class Main
  def start
    puts("Welcome to Simple Tasks Project")
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def read_from_file
    data = ProductionData.new
    @file_lines = data.read_data

    puts("Printing file content".colorize(:green))
    #p(fileReader.lines) # lines are in the array

    @file_lines.each do |line|
      p(line)
    end
  end

  def convert_fileLines_to_objects
    # TODO: assumption that input file has only one week - this will be changed later
    @week_converter = WeekConverter.new(@file_lines)
    @week_converter.convert_lines_to_week

    puts("Printing week for test purposes...")
    @week_converter.print_week
  end

  def create_tasks_from_week_days
    week = @week_converter.week
    @weekly_tasks = Array.new # each array element contains tasks for a given day

    week.days.each do |day|
      daily_extractor = DailyStatusExtractor.new(day)
      daily_extractor.proceed_day
      @weekly_tasks.push(daily_extractor.daily_tasks)
    end
  end

  def find_delayed_tasks
    tasks_manager = TasksManager.new
    results = Array.new

    @weekly_tasks.each do |daily_tasks|
      delayed_tasks = tasks_manager.find_delayed_tasks(daily_tasks)
      results += delayed_tasks
    end

    results
  end

  def end
    puts("Program execution finished".colorize(:green))
  end
end
