require_relative "Data/production_data"
require_relative "Extractors/daily_status_extractor"
require_relative "Managers/tasks_manager"
require_relative "Converters/week_converter"
require_relative "Models/week"

class Main
  def initialize(writer)
    @writer = writer
  end

  # Main entry point in application - executes other implemented operations
  def execute
    start
    read_from_file
    convert_fileLines_to_objects
    create_tasks_from_week_days
    all_delayed_tasks = find_delayed_tasks

    @writer.write_message("\nPrinting delayed tasks")
    all_delayed_tasks.each do |task|
      task.to_s
    end

    end_execution
  end

  def start
    @writer.write_message("Welcome to Simple Tasks Project")
  end

  def read_from_file
    data = ProductionData.new
    @file_lines = data.read_data

    @writer.write_message("Printing file content", :green)
    #p(fileReader.lines) # lines are in the array

    @file_lines.each do |line|
      p(line)
    end
  end

  def convert_fileLines_to_objects
    # TODO: assumption that input file has only one week - this will be changed later
    @week_converter = WeekConverter.new(@file_lines)
    @week_converter.convert_lines_to_week

    @writer.write_message("Printing week for test purposes...")
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

  def end_execution
    @writer.write_message("Program execution finished", :green)
  end
end
