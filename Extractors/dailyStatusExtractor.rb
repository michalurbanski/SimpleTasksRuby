require_relative '../Models/day'
require_relative '../Creators/taskCreator'

# Day extractor proceeds tasks' statuses for a given day
class DailyStatusExtractor

  def initialize(day)
    @day = day
  end

  def proceed_day
    @day.actions.each do |action|
      # TODO: proceed each task
      taskCreator = TaskCreator.new(action)
      task = taskCreator.create_task
    end
  end
end
