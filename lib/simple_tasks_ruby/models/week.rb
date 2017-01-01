class Week
  attr_accessor :name # TODO: find if and how this could be changed to reader property
  attr_reader :days

  def initialize(name = "undefined")
    @name = name
    @days = Array.new
  end

  def add_day(day)
    @days.push(day)
  end
end
