module SimpleTasksRuby
  class TasksFinder
    def initialize(tasks_grouped_by_status)
      @tasks_grouped_by_status = tasks_grouped_by_status
    end

    def find_tasks_by_status(task_status)
      return nil if @tasks_grouped_by_status.nil?

      return @tasks_grouped_by_status[task_status]
    end
  end
end
