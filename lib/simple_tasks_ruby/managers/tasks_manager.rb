class TasksManager
  def find_delayed_tasks(tasks)
    return nil if tasks.nil? || tasks.empty? 
 
    delayed_tasks = Array.new()

    tasks.each do |task|
      delayed_tasks.push(task) if task.is_a?(DelayedTask)
    end

    return delayed_tasks
  end
end
