# Prints tasks' related information
class TasksPrinter
  def initialize(writer)
    @writer = writer 
  end

  def print_tasks_information(tasks)
    tasks.each do |task|
      print_single_task_information(task)
    end
  end

  private
  def print_single_task_information(task) 
    @writer.write_message(task.to_s)
  end
end
