module SimpleTasksRuby
  class TasksManager
    attr_reader :tasks_grouped_by_status

    def initialize(file_lines)
      @tasks_grouped_by_status = nil
      @file_lines = file_lines
      @weeks_manager = WeeksManager.new
    end
    
    # TODO: move to tasks finder class
    # # TODO: it's not very fortunate that this method takes weeks, but the name of the class is TasksManager
    # def find_tasks_by_status_in_weeks(weeks, task_status)
    #   tasks = collect_tasks_for_all_weeks(weeks)

    #   return find_tasks_by_status(tasks, task_status)
    # end

    # def find_tasks_by_status(tasks, task_status)
    #   # TODO: when searching for tasks by multiple statuses we want to fetch hash with grouped tasks only once
    #   get_tasks_grouped_by_status(tasks)
      
    #   return @tasks_grouped_by_status.nil? ? nil : @tasks_grouped_by_status[task_status]
    # end

    def group_by_status
      tasks = get_tasks_from_file_lines

      return if ArrayModule.is_nil_or_empty?(tasks)

      @tasks_grouped_by_status = tasks.group_by { |task| task.status } 
    end

    private
      def get_tasks_from_file_lines
        weeks = @weeks_manager.convert_data_to_weeks(@file_lines)

        return nil if weeks.nil?
        
        return collect_tasks_for_all_weeks(weeks)
      end
    
      def collect_tasks_for_all_weeks(weeks)
        return weeks.collect{ |week| week.tasks }.flatten
      end
  end
end
