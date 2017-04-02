require 'spec_helper'

describe WeekConverter do
  describe "Converts lines to week" do 
    it "Converts week lines to week" do 
      week_name = "Week 1" 
      week_lines = []
      week_lines << "Monday 2017-04-03" 
      week_lines << "- First task" 
      week_lines << "Tuesday 2017-04-04" 
      week_lines << "- Second task" 

      week = act(week_name, week_lines)
      
      tasks_for_days = week.days.map{|day| day.length}
      sum_of_tasks = tasks_for_days.inject(0){|sum, x| sum + x}

      week.wont_be_nil    
      week.length.must_equal 2
      sum_of_tasks.must_equal 2
    end

    it "Converts week lines to week - end separator end empty lines" do 
      week_name = "Week 1" 
      week_lines = []
      week_lines << "Monday 2017-04-03" 
      week_lines << "- First task" 
      week_lines << ""
      week_lines << "Tuesday 2017-04-04" 
      week_lines << "- Second task"       
      week_lines << "--------------"

      week = act(week_name, week_lines)

      tasks_for_days = week.days.map{|day| day.length}
      sum_of_tasks = tasks_for_days.inject(0){|sum, x| sum + x}

      week.wont_be_nil    
      week.length.must_equal 2
      sum_of_tasks.must_equal 2
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
