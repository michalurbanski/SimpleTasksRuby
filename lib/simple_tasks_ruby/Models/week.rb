class Week
  attr_accessor :name
  attr_reader :days

  def initialize(name = "undefined")
    @name = name
    @days = Array.new # array
  end

  def add_day(day)
    @days.push(day)
  end
end
