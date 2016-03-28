require_relative '../Models/task'
require_relative '../Models/delayedTask'
require_relative '../Models/abortedTask'
require_relative '../Models/doneTask'
require_relative '../Extractors/status_extractor'

class TaskCreator
  def initialize(action, date)
    @action = action
    @date = date
    @statusExtractor = StatusExtractor.new(@action)
  end

  def create_task
    # TODO: create proper type of task based on status
    #status = @statusExtractor.
  end
end
