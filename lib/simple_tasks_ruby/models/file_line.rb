# For input read from file
class FileLine
  attr_accessor :line_number, :line

  def initialize(line_number = 0, line = "") 
    @line_number = line_number 
    @line = line
  end
end
