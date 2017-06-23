class TasksManager
  def find_delayed_tasks_in_multiple_weeks(weeks) 
    tasks = collect_tasks_for_all_weeks(weeks)

    find_delayed_tasks(tasks)
  end

  def find_delayed_tasks(tasks)
    return nil if tasks.nil? || tasks.empty? 
 
    delayed_tasks = Array.new()

    tasks.each do |task|
      delayed_tasks.push(task) if task.is_a?(DelayedTask)
    end

    return delayed_tasks
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
