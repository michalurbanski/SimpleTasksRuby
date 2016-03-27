require_relative '../Models/task'
require_relative '../Models/delayedTask'
require_relative '../Models/abortedTask'
require_relative '../Models/doneTask'
require_relative '../Extractors/statusExtractor'

class TaskCreator
  def initialize(action)
    @action = action
    @statusExtractor = StatusExtractor.new(@action)
  end

  def create_task
    #status = @statusExtractor.
  end
end
