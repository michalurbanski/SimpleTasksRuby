require 'spec_helper'

describe WeeksParser do
  describe "Valid week lines" do
    it "Line with week from 1 to 9 is treated as a week" do
      weeks = Array.new(9, "Week ")
      weeks.map!.with_index{|x, i| x + (i+1).to_s}

      result = weeks.all? { |week| WeeksParser.is_line_with_week(week) }

      result.must_equal true
    end

    it "Line with week above 10 is treated as a week" do
      weeks = ["week 10", "Week 99"]

      result = weeks.all? {|week| WeeksParser.is_line_with_week(week)}

      result.must_equal true
    end

    it "Line with week is case-insensitive" do
      line = "week 9"

      result = WeeksParser.is_line_with_week line

      result.must_equal true
    end
  end

  describe "Invalid week lines" do
    it "Line with only number is not a week" do
      line = "12"

      result = WeeksParser.is_line_with_week line

      result.must_equal false
    end

    it "Line does not have correct week indication" do
      line = "this is not a week"

      result = WeeksParser.is_line_with_week line

      result.must_equal false
    end
  end

  describe "Line representation parsing" do 
    it 'Collection of file_lines can be parsed' do 
      input_data = [FileLine.new(1, '- first task')]

      result = WeeksParser.is_line_with_week(input_data.first.data)
      
      result.must_equal false
    end

    it 'Collection of file_lines allows to parse week name' do 
      input_data = [FileLine.new(1, 'Week 1')]

      result = WeeksParser.is_line_with_week(input_data.first.data)

      result.must_equal true
    end
  end 
end
