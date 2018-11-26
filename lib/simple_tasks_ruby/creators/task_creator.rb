module SimpleTasksRuby
  class TaskCreator
    def initialize(action, date)
      @action = action
      @date = date
    end

    def create_task
      statusModel = StatusExtractor.extract_status(@action)
      status = statusModel.status
      dateText = statusModel.date

      if !dateText.nil?
        delayedDoneDate = Date.strptime(dateText, '%Y-%m-%d')
      end

      case(status)
        when TaskStatus::DONE then return Task.new(@action, @date, 
          {status: TaskType::DONE})
        when TaskStatus::ABORTED then return Task.new(@action, @date, 
          {status: TaskType::ABORTED})
        when TaskStatus::DELAYED then return Task.new(@action, @date, 
          {status: TaskType::DELAYED})
        when TaskStatus::DELAYED_DONE then return Task.new(@action, @date, 
          {status: TaskType::DELAYED_DONE, done_date: delayedDoneDate})
      end

      # If not the case then this is task without any status, i.e. original one
      return Task.new(@action, @date)
    end
  end
end
