class IncorrectDateForDayException < StandardError
  def initialize(text="Default day")
    @text = text
  end

  def to_s
    puts "Incorrect date for day \"#{@text}\""
  end
end
