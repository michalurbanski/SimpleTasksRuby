class Main
  def initialize()
    @writer = ConsoleWriter.new
    reader = FileSystemDataReader.new({
      :path => ProductionData.default_path
      })

    @file_service = FileService.new(@writer, reader)
  end

  # Main entry point in application - executes other implemented operations
  def execute
    begin
      start
      file_lines = read_from_file
      # print_file_content file_lines # Debug information

      # #TODO: Continue here !!! - line below will throw an error and this is on purpose - as logic is under rewrite
      # weeks = LinesToWeeksConverter.convert nil

      # # OLD LOGIC
      # convert_fileLines_to_objects
      # create_tasks_from_week_days
      # all_delayed_tasks = find_delayed_tasks

      # @writer.write_message("\nPrinting delayed tasks")
      # @writer.write_array(all_delayed_tasks)
      
      # exception raised on purpose to test logic
      # raise StandardError, "message" 

      end_execution
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
      # path = ProductionData.default_path
      file_lines = @file_service.get_lines_from_file(path)
    end

    def print_file_content(file_lines)
      @writer.write_message("Printing file content", :green)
      @writer.write_array(file_lines, debug: true)
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
      @writer.write_success("Program execution finished")
    end
end
