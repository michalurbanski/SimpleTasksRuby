class Main
  def initialize()
    @writer = ConsoleWriter.new
    start

    reader = FileSystemDataReader.new({
      :path => ProductionData.default_path
      })

    @file_service = FileService.new(reader)
    @weeks_manager = WeeksManager.new
  end

  # Main entry point in application - executes other implemented operations
  def execute
    begin
      file_lines = read_from_file
      # print_file_content file_lines # Debug information - write this to file if needed

      @weeks_manager.convert_data_to_weeks(file_lines) 
      weeks = @weeks_manager.weeks

      # # OLD LOGIC
      # create_tasks_from_week_days
      # all_delayed_tasks = find_delayed_tasks

      # @writer.write_message("\nPrinting delayed tasks")
      # @writer.write_array(all_delayed_tasks)
      
      # Error raised on purpose to test logic
      # raise StandardError, "message" 

    rescue => e # Rescues StandardError
      @writer.write_error("Error occured during application execution: " + e.to_s + "\n")
      @writer.write_error_array(e.backtrace) 
    ensure
      end_execution
    end
  end

  private
    def start
      @writer.write_success("Welcome to Simple Tasks Project")
    end

    def read_from_file
      @file_service.get_lines_from_file
    end

    def print_file_content(file_lines)
      @writer.write_message("Printing file content", :green)
      @writer.write_array(file_lines, debug: true)
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
      @writer.write_success("Program execution finished")
    end
end
