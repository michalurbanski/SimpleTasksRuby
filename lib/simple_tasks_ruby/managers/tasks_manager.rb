class TasksManager
  def find_delayed_tasks_in_multiple_weeks(weeks) 
    tasks = collect_tasks_for_all_weeks(weeks)

    find_delayed_tasks(tasks)
  end

  def find_tasks_by_status(tasks, task_status)
    return nil if tasks.nil? || tasks.empty?

    tasks.select { |task| task.status == task_status } 
  end
  
  # TODO: Obsolete - to be removed
  # TODO: When removed then collect_tasks_for_all_weeks method needs to be exposed as public
  def find_delayed_tasks(tasks)
    find_tasks_by_status(tasks, SimpleTasksRuby::TaskType::DELAYED)
  end

  private 
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
