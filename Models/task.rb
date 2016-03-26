class Task
  attr_reader :status
  attr_reader :title
  attr_reader :isDoneOnTime

  def initialize(action)
    @action = action
  end
end
