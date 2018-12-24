module SimpleTasksRuby
  class DayFactory
    class << self # equivalent to extend self
      def create_valid_day
        date = Time.now.strftime("%Y-%m-%d")
        day = Day.new("Monday #{date}")

        task = Task.new("First task", Date.parse(date))
        day.add_task(task)

        return day
      end

      def create_empty_day
        date = Time.now.strftime("%Y-%m-%d")
        
        return Day.new("Monday #{date}")
      end
    end
  end
end
