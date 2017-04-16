class Main
  def initialize
    @writer = ConsoleWriter.new
    start

    reader = FileSystemDataReader.new({
      :path => ProductionData.get_path
      })

    @file_service = FileService.new(reader)
    @weeks_manager = WeeksManager.new
    @tasks_manager = TasksManager.new
    @tasks_printer = TasksPrinter.new(@writer)
  end

  # Main entry point in application - executes other implemented operations
  def execute
    begin
      file_lines = read_from_file
      # print_file_content file_lines # Debug information - write this to file if needed

      @weeks_manager.convert_data_to_weeks(file_lines) 
      weeks = @weeks_manager.weeks
      delayed_tasks = find_delayed_tasks(weeks)

      @writer.write_success("Printing delayed tasks:")
      @tasks_printer.print_tasks_information(delayed_tasks)

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

    def find_delayed_tasks(weeks) 
      @tasks_manager.find_delayed_tasks_in_multiple_weeks(weeks)
    end

    def end_execution
      @writer.write_success("Program execution finished")
    end
end
