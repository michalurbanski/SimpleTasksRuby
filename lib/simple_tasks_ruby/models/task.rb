class Task
  attr_reader :title
  attr_reader :originalDate

  def initialize(title, originalDate)
    @title = title
    @originalDate = originalDate
  end

  def to_s
    "#{@originalDate} - #{@title}"
  end
end
