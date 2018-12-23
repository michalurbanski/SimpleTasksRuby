module SimpleTasksRuby
  class IncorrectDateForDayException < StandardError
    def initialize(text="Default day")
      super "Incorrect date for day \"#{text}\""
    end
  end
end
