module SimpleTasksRuby
  class DayFactory
    class << self # equivalent to extend self
      def create_valid_day
        date = get_current_date
        day = Day.new("Monday #{date}")

        task = Task.new("First task", Date.parse(date))
        day.add_task(task)

        return day
      end

      def create_empty_day
        Day.new("Monday #{get_current_date}")
      end

      private
        def get_current_date
          Time.now.strftime(DateConsts::DAY_FORMAT)
        end
    end
  end
end
