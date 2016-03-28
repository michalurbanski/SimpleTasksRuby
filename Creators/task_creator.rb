require_relative '../Models/task'
require_relative '../Models/delayed_task'
require_relative '../Models/aborted_task'
require_relative '../Models/done_task'
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
