class TasksManager
  def find_delayed_tasks_in_weeks(weeks) 
    tasks = collect_tasks_for_all_weeks(weeks)

    find_delayed_tasks(tasks)
  end

  def find_delayed_tasks(tasks)
    find_tasks_by_status(tasks, SimpleTasksRuby::TaskType::DELAYED)
  end

  def get_tasks_grouped_by_status(tasks)
    # TODO: use this method for find_tasks_by_status -> refactoring
    return nil if ArrayModule.is_nil_or_empty?(tasks)

    tasks.group_by { |task| task.status } 
  end

  private
    def find_tasks_by_status(tasks, task_status)
      return nil if ArrayModule.is_nil_or_empty?(tasks)

      tasks.select { |task| task.status == task_status } 
    end

    def collect_tasks_for_all_weeks(weeks)
      tasks = Array.new 

      weeks.each do |week|
        tasks += collect_tasks_for_week(week)
      end

      return tasks
    end

    def collect_tasks_for_week(week) 
      tasks = Array.new

      week.days.each do |day|
        tasks += day.tasks
      end

      return tasks
    end
end
