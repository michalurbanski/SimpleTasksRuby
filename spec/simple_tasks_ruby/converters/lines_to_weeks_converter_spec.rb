require 'spec_helper'

describe LinesToWeeksConverter do 
  before do 
    @converter = LinesToWeeksConverter.new
  end

  def act(lines) 
    @converter.convert(lines) 
  end

  describe "Converts correct input to weeks" do 
    it "Converts lines to week" do 
      lines = Array.new
      lines << "Week 1"
      lines << "Monday 2015-01-01"
      lines << "- first task"
      lines << "- second task"
      lines << "Tuesday 2015-01-02"

      # converter = LinesToWeeksConverter.new
      weeks = act(lines)

      weeks.length.must_equal 1
      weeks[0].days.length.must_equal 2
    end 

    it "Converts lines with multiple weeks to weeks objects" do 
      lines = Array.new 
      lines << "Week 1" 
      lines << "Monday 2015-01-01" 
      lines << ""
      lines << "--------" 
      lines << "week 2" 
      lines << "Monday 2015-01-08" 
      lines << "--------" 
      lines << "--------" 

      weeks = act(lines) 

      weeks.length.must_equal 2
      weeks.first.days.length.must_equal 1
      weeks.last.days.length.must_equal 1
    end
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
      lines << "Monday 2015-01-01" 
      lines << "- this is first task" 

      weeks = act(lines) 

      weeks.must_be_empty
    end

    it "Lines start not from a week tag, but have one" do 
      lines = Array.new
      lines << "Monday 2015-01-01" 
      lines << "- this is first task" 
      lines << "Week 1" 
      lines << "Monday 2015-01-08" 

      weeks = act(lines) 

      weeks.length.must_equal 1
    end 
  end
end
