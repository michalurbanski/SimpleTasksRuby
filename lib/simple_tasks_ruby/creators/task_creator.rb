class TaskCreator
  def initialize(action, date)
    @action = action
    @date = date
    @statusExtractor = StatusExtractor.new(@action)
  end

  def create_task
    statusModel = @statusExtractor.extract_status
    status = statusModel.status
    dateText = statusModel.date

    if !dateText.nil?
      delayedDoneDate = Date.strptime(dateText, '%Y-%m-%d')
    end

    case(status)
      when TaskStatus::DONE then return Task.new(@action, @date, 
        {status: SimpleTasksRuby::TaskType::DONE})
      when TaskStatus::ABORTED then return Task.new(@action, @date, 
        {status: SimpleTasksRuby::TaskType::ABORTED})
      when TaskStatus::DELAYED then return Task.new(@action, @date, 
        {status: SimpleTasksRuby::TaskType::DELAYED})
      when TaskStatus::DELAYED_DONE then return Task.new(@action, @date, 
        {status: SimpleTasksRuby::TaskType::DELAYED_DONE, done_date: delayedDoneDate})
    end

    # If not the case then this is task without any status, i.e. original one
    return Task.new(@action, @date)
  end
end
