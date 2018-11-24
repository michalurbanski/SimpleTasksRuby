module SimpleTasksRuby
  class TasksManager
    # TODO: it's not very fortunate that this method takes weeks, but the name of the class is TasksManager
    def find_tasks_by_status_in_weeks(weeks, task_status)
      tasks = collect_tasks_for_all_weeks(weeks)

      return find_tasks_by_status(tasks, task_status)
    end

    # Is any special treatment for delayed tasks needed?
    def find_delayed_tasks(tasks)
      find_tasks_by_status(tasks, SimpleTasksRuby::TaskType::DELAYED)
    end

    def find_tasks_by_status(tasks, task_status)
      # TODO: when searching for tasks by multiple statuses we want to fetch hash with grouped tasks only once
      tasks_grouped_by_status = get_tasks_grouped_by_status(tasks)

      return tasks_grouped_by_status.nil? ? nil : tasks_grouped_by_status[task_status]
    end

    def get_tasks_grouped_by_status(tasks)
      return nil if ArrayModule.is_nil_or_empty?(tasks)

      tasks.group_by { |task| task.status } 
    end

    private
      def collect_tasks_for_all_weeks(weeks)
        return weeks.collect{ |week| week.tasks }.flatten
      end
  end
end
