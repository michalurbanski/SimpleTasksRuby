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

      converter = WeekConverter.new(week_name, week_lines) 
      week = converter.convert_lines_to_week

      tasks_for_days = week.days.map{|day| day.length}
      sum_of_tasks = tasks_for_days.inject(0){|sum, x| sum + x}

      week.wont_be_nil    
      week.length.must_equal 2
      sum_of_tasks.must_equal 2
    end
  end

  # describe "Determine end of the week" do
  #   it "End of the week is valid" do
  #     result = WeekConverter.is_end_of_week("---")
  #     result.must_equal true
  #     #result.must_be :==, true # this condition can also be written as
  #   end

  #   it "End of the week is not valid" do
  #     result = WeekConverter.is_end_of_week("--")
  #     result.must_equal false
  #   end
  # end

  # describe "Convert lines to week" do
  #   # it "convert lines to week should return week object" do
  #   #   week = @week_converter.convert_lines_to_week

  #   #   week.must_be_instance_of Week
  #   # end

  #   # it "converting lines to week should return week object with proper data" do
  #   #   week = @week_converter.convert_lines_to_week

  #   #   week.name.must_equal "Week 1"
  #   #   week.days.length.must_equal 2
  #   #   week.days[0].actions.length.must_equal 2
  #   # end

  #   # it "converted lines to week should have defined number of days" do
  #   #   week = @week_converter.convert_lines_to_week

  #   #   week.days.length.must_equal 2
  #   # end

  #   it "parse lines and convert them to days" do
  #     parsed_week = @week_converter.parse_week

  #     @week_converter.week.name.must_equal "Week 1"
  #     parsed_week.must_be_instance_of Hash
  #     parsed_week.keys.length.must_equal 2
  #   end
  # end
end
