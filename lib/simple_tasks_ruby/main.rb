require 'libraries'

module SimpleTasksRuby
  class Main
    def initialize
      @writer = ConsoleWriter.new
      start_message

      @configuration_service = ConfigurationService.new
      input_file_path = @configuration_service.read_value(:input_file_path)

      reader = FileSystemDataReader.new({ :path => input_file_path })

      @file_service = FileService.new(reader)
      @tasks_printer = TasksPrinter.new(@writer)
    end

    # Main entry point in application - executes other implemented operations
    def execute
      begin
        file_lines = read_lines_from_file
        
        # print_file_content file_lines # Debug information - write this to file if needed
 
        tasks = get_tasks(file_lines)
        delayed_tasks = find_delayed_tasks(tasks)

        @writer.write_success("Printing delayed tasks:")
        @tasks_printer.print(delayed_tasks)

        @writer.write_message("\nPrinting summary of tasks")
        tasks_summary_engine = TasksSummaryEngine.new(tasks)
        tasks_summary_engine.calculate()

        @writer.write_message("Total number of tasks is: " + tasks_summary_engine.total.to_s)
        @writer.write_message(tasks_summary_engine.tasks_count_by_status)

      rescue => e # Rescues StandardError
        @writer.write_error("Error occured during application execution: #{e.to_s}\n")
        @writer.write_error(e.backtrace) 
      ensure
        end_execution
      end
    end

    private
      def start_message
        @writer.write_success("Welcome to Simple Tasks Project")
      end

      def read_lines_from_file
        @file_service.read_lines_from_file
      end

      def print_file_content(file_lines)
        @writer.write_message("Printing file content", :green)
        @writer.write_array(file_lines, debug: true)
      end

      def get_tasks(file_lines)
        tasks_manager = TasksManager.new(file_lines)
        tasks_manager.group_by_status
        tasks_manager.tasks_grouped_by_status
      end

      def find_delayed_tasks(tasks) 
        tasks_finder = TasksFinder.new(tasks)
        tasks_finder.find_tasks_by_status(TaskType::DELAYED)
      end

      def end_execution
        @writer.write_success("Program execution finished")
      end
  end
end
