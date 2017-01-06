class IncorrectDateForDayException < Exception
  def initialize(text)
    @text = text
  end

  def to_s
    puts "Incorrect date for day \"#{@text}\""
  end
end
