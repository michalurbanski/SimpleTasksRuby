require_relative 'possible_days'

class PossibleDaysTester
  def initialize
    @possibleDays = PossibleDays.new.days
  end

  def is_day(text)
    lower_days = @possibleDays.map{|day| day.downcase}
    lower_text = text.downcase

    lower_days.each do |day|
      if lower_text.start_with?(day)
        return true
      else
        return false
      end
    end
  end
end
