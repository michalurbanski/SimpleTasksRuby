# Task can be done in the same day - in this case originalDate == doneDate
# Or it can be delayed and done later - in this case originalDate < doneDate
require_relative 'task'

class DoneTask < Task
  attr_reader :doneDate

  def initialize(title, originalDate, doneDate)
    super(title, originalDate)
    @doneDate = doneDate
  end

  def was_delayed
    return @doneDate > @originalDate
  end
end
