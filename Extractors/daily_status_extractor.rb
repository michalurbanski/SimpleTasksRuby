require_relative '../Models/day'
require_relative '../Creators/task_creator'
require 'date'

# Day extractor proceeds tasks' statuses for a given day
class DailyStatusExtractor
  attr_reader :daily_tasks

  def initialize(day)
    @day = day
  end

  def proceed_day
    @daily_tasks = Array.new

    @day.actions.each do |action|
      # TODO: hardcoded date for now - this property should be taken from date
      date = Date.new(2016, 1, 1)
      taskCreator = TaskCreator.new(action, date)
      task = taskCreator.create_task

      @daily_tasks.push(task)
    end
  end
end
