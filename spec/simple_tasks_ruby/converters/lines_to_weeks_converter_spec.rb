require 'spec_helper'

describe LinesToWeeksConverter do 
  before do 
    @converter = LinesToWeeksConverter.new
  end

  describe "Converts correct input to weeks" do 
    it "Converts lines to week" do 
      skip("Temporary skipped")

      lines = Array.new
      lines << "Week 1"
      lines << "Monday 2015-01-01"
      lines << "- first task"
      lines << "- second task"
      lines << "Tuesday 2015-01-02"

      converter = LinesToWeeksConverter.new
      weeks = converter.convert(lines) 
    end 
  end

  describe "Handles incorrect input" do 
    it "Nil lines cause error" do 
      lambda { 
        @converter.convert(nil)
      }.must_raise ArgumentError      
    end

    it "Empty lines cause error" do 
      lambda { 
        @converter.convert([])
      }.must_raise ArgumentError    
    end
  end
end

# describe LinesToWeeksConverter do
#   describe "Converts lines to weeks correctly" do
#     before do
#       @week_lines = ["Week 1", "Week 2", "Week 3"]
#       @days_for_first_week = ["Monday 2016-12-05", "- first task", "Tuesday 2016-12-06"]
#       @days_for_second_week = ["Monday 2016-12-12", "- delayed, - second task"]

#       @lines_to_weeks_converter = LinesToWeeksConverter.new
#     end

#     # it "Weeks are properly parsed" do
#     #   weeks = @lines_to_weeks_converter.convert(@week_lines)

#     #   weeks.length.must_equal(@week_lines.length)
#     # end

#     # it "Weeks with first week having days is properly parsed" do
#     #   lines = Array.new(@week_lines)
#     #   lines.insert(1, @days_for_first_week).flatten! # first week has days

#     #   weeks = @lines_to_weeks_converter.convert(lines)

#     #   weeks.length.must_equal(@week_lines.length)
#     #   weeks[@week_lines[0]].length.must_equal(@days_for_first_week.length)
#     # end

#     # it "Weeks with days for each one are properly parsed" do
#     #   lines = Array.new(@week_lines)
#     #   lines.insert(1, @days_for_first_week)
#     #   lines.insert(3, @days_for_second_week)
#     #   lines.flatten! # first and second week have days with actions

#     #   weeks = @lines_to_weeks_converter.convert(lines)

#     #   weeks.length.must_equal(@week_lines.length)
#     #   weeks[@week_lines[0]].length.must_equal(@days_for_first_week.length)
#     #   weeks[@week_lines[1]].length.must_equal(@days_for_second_week.length)
#     # end

#     # it "Nil input collection of lines causes runtime error" do
#     #   lambda {
#     #       @lines_to_weeks_converter.convert(nil)
#     #     }.must_raise ArgumentError
#     # end

#     # it "Empty input collection of lines causes runtime error" do
#     #   lambda {
#     #       @lines_to_weeks_converter.convert(Array.new)
#     #     }.must_raise ArgumentError
#     # end
#   end
# end
