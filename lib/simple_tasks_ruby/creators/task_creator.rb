module SimpleTasksRuby
  class TaskCreator
    def initialize(action, date)
      @action = action
      @date = date
    end

    def create_task
      status_model = StatusExtractor.extract_status(@action)
      status = status_model.status
      date_text = status_model.date

      unless date_text.nil?
        delayed_done_date = Date.strptime(date_text, DateConsts::DAY_FORMAT)
      end

      case(status)
        when TaskStatus::DONE then return Task.new(@action, @date, 
          {status: TaskType::DONE})

        when TaskStatus::ABORTED then return Task.new(@action, @date, 
          {status: TaskType::ABORTED})

        when TaskStatus::DELAYED then return Task.new(@action, @date, 
          {status: TaskType::DELAYED})

        when TaskStatus::DELAYED_DONE then return Task.new(@action, @date, 
          {status: TaskType::DELAYED_DONE, done_date: delayed_done_date})

        # If not the case then this is task without any status, i.e. not acted upon
        else return Task.new(@action, @date, 
          {status: TaskType::NOT_STARTED})
      end
    end
  end
end
