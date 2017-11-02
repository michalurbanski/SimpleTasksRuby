# Allows to get various information from task collection
module SimpleTasksRuby
  class TasksSummaryEngine
    attr_reader :total
    attr_reader :tasks_count_by_status
  
    def initialize(tasks_grouped_by_status)
      @tasks_hash = tasks_grouped_by_status
    end

    def calculate
      calculate_count_by_status
      calculate_total
    end

    private
    def calculate_count_by_status
      @tasks_count_by_status = {}

      @tasks_hash.each do |key, value|
        @tasks_count_by_status[key] = @tasks_hash[key].length
      end
    end

    def calculate_total
      @total = 0
      @tasks_count_by_status.each_value {|value| @total += value}
    end
  end
end
