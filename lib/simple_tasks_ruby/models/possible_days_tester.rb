module SimpleTasksRuby
  class PossibleDaysTester
    def initialize
      @possibleDays = PossibleDays.new.days
    end

    def is_day(text)
      lower_days = @possibleDays.map{|day| day.downcase}
      lower_text = text.downcase

      lower_days.each do |day|
        return true if lower_text.start_with?(day)

        next # Check if next element is a day
      end

      return false # If no day found than return false
    end
  end
end
