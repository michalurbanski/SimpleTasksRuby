require 'spec_helper'

describe LinesToWeeksConverter do 
  before do 
    @converter = LinesToWeeksConverter.new

    @multiple_weeks_lines = Array.new
    @multiple_weeks_lines << FileLine.new(1, "Week 1")
    @multiple_weeks_lines << FileLine.new(2, "Monday 2015-01-01") 
    @multiple_weeks_lines << FileLine.new(3, "") 
    @multiple_weeks_lines << FileLine.new(4, "--------") 
    @multiple_weeks_lines << FileLine.new(5, "week 2") 
    @multiple_weeks_lines << FileLine.new(6, "Monday 2015-01-08") 
    @multiple_weeks_lines << FileLine.new(7, "--------") 
    @multiple_weeks_lines << FileLine.new(8, "--------") 
  end

  def act(lines) 
    @converter.convert(lines) 
  end

  describe "Converts correct input to weeks" do 
    # it "Converts lines to week" do 
    #   lines = Array.new
    #   lines << FileLine.new(1, "Week 1") 
    #   lines << FileLine.new(2, "Monday 2015-01-01") 
    #   lines << FileLine.new(3, "- first task") 
    #   lines << FileLine.new(4, "- second task") 
    #   lines << FileLine.new(5, "Tuesday 2015-01-02")

    #   weeks = act(lines)

    #   weeks.length.must_equal 1
    #   weeks[0].days.length.must_equal 2
    # end 

    it "Converts lines with multiple weeks to weeks objects" do 
      weeks = act(@multiple_weeks_lines) 

      weeks.length.must_equal 2
      weeks.first.days.length.must_equal 1
      weeks.last.days.length.must_equal 1
    end

    # it 'Converts collection of objects to weeks' do 
    #   weeks = act(@multiple_weeks_lines)

    #   weeks.length.must_equal 2
    #   weeks.first.days.length.must_equal 1
    #   weeks.last.days.lengt.must_equal 1
    # end
  end

  describe "Handles incorrect input" do 
    it "Nil lines cause error" do 
      lambda { 
        act(nil) 
      }.must_raise ArgumentError      
    end

    it "Empty lines cause error" do 
      lambda { 
        act([])
      }.must_raise ArgumentError    
    end

    it "Missing any week tag returns empty weeks collection" do 
      lines = Array.new
      lines << FileLine.new(1, "Monday 2015-01-01") 
      lines << FileLine.new(2, "- this is first task")

      weeks = act(lines) 

      weeks.must_be_empty
    end

    it "Lines start not from a week tag, but have one" do 
      lines = Array.new
      lines << FileLine.new(1, "Monday 2015-01-01") 
      lines << FileLine.new(2, "- this is first task") 
      lines << FileLine.new(3, "Week 1") 
      lines << FileLine.new(4, "Monday 2015-01-08")

      weeks = act(lines) 

      weeks.length.must_equal 1
    end 
  end
end
