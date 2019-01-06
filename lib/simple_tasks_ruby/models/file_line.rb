# For input read from file
module SimpleTasksRuby
  class FileLine
    attr_accessor :line_number, :data

    def initialize(line_number = 0, data = "") 
      @line_number = line_number 
      @data = data
    end

    def to_s
      "#{line_number}, #{data}"
    end
  end
end
