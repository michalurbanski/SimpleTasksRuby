class Task
  attr_reader :title
  attr_reader :original_date
  attr_reader :properties

  def initialize(title, original_date, properties = nil)
    @title = title
    @original_date = original_date
    @properties = properties
  end

  def to_s
    "#{@original_date} - #{@title}"
  end
end
