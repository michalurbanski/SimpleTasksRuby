class TaskCreator
  def initialize(action, date)
    @action = action
    @date = date
    puts "Task creator is checking statuses" 
    p(action)
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
      when TaskStatus::DONE then return DoneTask.new(@action, @date, @date)
      when TaskStatus::ABORTED then return AbortedTask.new(@action, @date)
      when TaskStatus::DELAYED then return DelayedTask.new(@action, @date)
      when TaskStatus::DELAYED_DONE then return DoneTask.new(@action, @date, delayedDoneDate)
    end

    # If not the case then this is task without any status, i.e. original one
    return Task.new(@action, @date)
  end
end
