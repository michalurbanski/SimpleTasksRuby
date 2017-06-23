class TasksManager
  def get_all_tasks_information(weeks) 
    return nil if weeks.nil? || weeks.empty? 

    all_tasks_information = Hash.new
    delayed_tasks = Array.new 
    aborted_tasks = Array.new 
    done_tasks = Array.new
    awaiting_tasks = Array.new

    all_tasks = collect_tasks_for_all_weeks(weeks) 

    all_tasks.each do |task|
      if task.is_a?(DelayedTask)
        delayed_tasks.push(task) 
      elsif task.is_a?(AbortedTask) 
        aborted_tasks.push(task) 
      elsif task.is_a?(DoneTask)
        done_tasks.push(task) 
      elsif task.is_a?(Task)
        awaiting_tasks.push(task) 
      end
    end

    all_tasks_information[:delayed_tasks] = delayed_tasks
    all_tasks_information[:aborted_tasks] = aborted_tasks
    all_tasks_information[:done_tasks] = done_tasks
    all_tasks_information[:awaiting_tasks] = awaiting_tasks

    return all_tasks_information
  end

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
