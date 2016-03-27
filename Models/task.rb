class Task
  attr_reader :title
  attr_reader :originalDate

  def initialize(title, originalDate)
    @title = title
    @originalDate = originalDate
  end
end
