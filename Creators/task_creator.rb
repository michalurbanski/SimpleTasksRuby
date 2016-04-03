require_relative '../Models/task'
require_relative '../Models/delayed_task'
require_relative '../Models/aborted_task'
require_relative '../Models/done_task'
require_relative '../Extractors/status_extractor'
require_relative '../Modules/task_status'

class TaskCreator
  def initialize(action, date)
    @action = action
    @date = date
    @statusExtractor = StatusExtractor.new(@action)
  end

  def create_task
    # TODO: create proper type of task based on status
    status = @statusExtractor.extract_status

    case(status)
      when TaskStatus::DONE then return DoneTask.new(@action, @date, @date)
      when TaskStatus::ABORTED then return AbortedTask.new(@action, @date)
      when TaskStatus::DELAYED then return DelayedTask.new(@action, @date)
        #TODO: fix finish date of the task
      when TaskStatus::DELAYED_DONE then return DoneTask.new(@action, @date, @date)
    end
  end
end
