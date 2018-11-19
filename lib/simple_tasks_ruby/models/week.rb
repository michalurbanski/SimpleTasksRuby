module SimpleTasksRuby
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

    def is_valid
      length == 7 # later constraint that all objects must days can be added, but this will require tests to change
    end

    def length #TODO: change to number_of_days - it will be more descriptive
      @days.length
    end
  end
end
