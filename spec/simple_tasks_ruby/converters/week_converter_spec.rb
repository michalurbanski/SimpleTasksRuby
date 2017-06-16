require 'spec_helper'

describe WeekConverter do
  describe "Converts lines to week" do 
    it "Converts week lines to week" do 
      week_name = "Week 1" 
      week_lines = []
      week_lines << FileLine.new(2, "Monday 2017-04-03")
      week_lines << FileLine.new(3, "- First task") 
      week_lines << FileLine.new(4, "Tuesday 2017-04-04") 
      week_lines << FileLine.new(5, "- Second task")

      week = act(week_name, week_lines)
      
      tasks_for_days = week.days.map{|day| day.length}
      sum_of_tasks = tasks_for_days.inject(0){|sum, x| sum + x}

      week.wont_be_nil    
      week.length.must_equal 2
      sum_of_tasks.must_equal 2
    end

    it "Converts week lines to week - end separator end empty lines are properly handled" do 
      week_name = "Week 1"
      week_lines = []
      week_lines << FileLine.new(1, "Monday 2017-04-03")
      week_lines << FileLine.new(2, "- First task")
      week_lines << FileLine.new(3, "")
      week_lines << FileLine.new(4, "Tuesday 2017-04-04")
      week_lines << FileLine.new(5, "- Second task")
      week_lines << FileLine.new(6, "--------------")

      week = act(week_name, week_lines)

      tasks_for_days = week.days.map{|day| day.length}
      sum_of_tasks = tasks_for_days.inject(0){|sum, x| sum + x}

      week.wont_be_nil    
      week.length.must_equal 2
      sum_of_tasks.must_equal 2
    end

    it "Empty week does not cause error" do 
      week_name = "Week 1" 
      week_lines = []

      week = act(week_name, week_lines)
      week.wont_be_nil
      week.length.must_equal 0
    end

    it "Week with empty lines shouldn't cause error" do 
      week_name = "Week 1" 
      week_lines = [FileLine.new(1, "")]

      week = act(week_name, week_lines)
      week.wont_be_nil
      week.length.must_equal 0
    end

    def act(week_name, week_lines) 
      converter = WeekConverter.new(week_name, week_lines) 
      week = converter.convert_lines_to_week
    end
  end

  describe "Determine end of the week" do 
    it "End of the week is valid - minimal length of line" do 
      result = WeekConverter.is_end_of_week("---")
      result.must_equal true
    end

    it "End of the week is valid - longer than minimal line" do 
      result = WeekConverter.is_end_of_week("----------")
      result.must_equal true
    end 

    it "End of the week line is not valid - too short" do 
      result = WeekConverter.is_end_of_week("--") 
      result.must_equal false
    end
  end
end
