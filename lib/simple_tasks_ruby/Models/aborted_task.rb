require_relative 'task'

class AbortedTask < Task
  def initialize(title, originalDate)
    super(title, originalDate)
  end
end
