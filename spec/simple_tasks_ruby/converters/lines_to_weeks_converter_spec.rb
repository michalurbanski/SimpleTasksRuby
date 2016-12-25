require 'spec_helper'

describe LinesToWeeksConverter do
  describe "Converts lines to weeks correctly" do
    before do
      @week_lines = ["Week 1", "Week 2", "Week 3"]
      @days_for_first_week = ["Monday 2016-12-05", "- first task", "Tuesday 2016-12-06"]
      @days_for_second_week = ["Monday 2016-12-12", "- delayed, - second task"]
    end

    it "Weeks are properly parsed" do
      weeks = LinesToWeeksConverter.convert(@week_lines)

      weeks.length.must_equal(@week_lines.length)
    end

    it "Weeks with first week having days is properly parsed" do
      lines = Array.new(@week_lines)
      lines.insert(1, @days_for_first_week).flatten! # first week has days

      weeks = LinesToWeeksConverter.convert(lines)

      weeks.length.must_equal(@week_lines.length)
      weeks[@week_lines[0]].length.must_equal(@days_for_first_week.length)
    end

    it "Weeks with days for each one are properly parsed" do
      lines = Array.new(@week_lines)
      lines.insert(1, @days_for_first_week)
      lines.insert(3, @days_for_second_week)
      lines.flatten! # first and second week have days with actions

      weeks = LinesToWeeksConverter.convert(lines)

      weeks.length.must_equal(@week_lines.length)
      weeks[@week_lines[0]].length.must_equal(@days_for_first_week.length)
      weeks[@week_lines[1]].length.must_equal(@days_for_second_week.length)
    end
  end

  describe "Incorrect initialization" do
    it "Nil input collection of lines causes runtime error" do
      lambda {
          LinesToWeeksConverter.convert(nil)
        }.must_raise RuntimeError
    end

    it "Empty input collection of lines causes runtime error" do
      lambda {
          LinesToWeeksConverter.convert(Array.new)
        }.must_raise RuntimeError
    end
  end
end
