require_relative '../Models/day'

# Day extractor proceeds tasks' statuses for a given day
class DailyStatusExtractor

  def initialize(day)
    @day = day
  end

  def proceed_day
    @day.actions.each do |action|
      # TODO: proceed each task
      task = Task.new(action)
    end
  end
end
