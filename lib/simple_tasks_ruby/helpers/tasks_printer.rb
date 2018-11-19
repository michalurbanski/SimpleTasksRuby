# Prints tasks' related information
module SimpleTasksRuby
  class TasksPrinter
    def initialize(writer)
      @writer = writer 
    end

    def print(tasks)
      tasks.each do |task|
        print_task(task)
      end
    end

    private
      def print_task(task) 
        @writer.write_message(task.to_s)
      end
  end
end
