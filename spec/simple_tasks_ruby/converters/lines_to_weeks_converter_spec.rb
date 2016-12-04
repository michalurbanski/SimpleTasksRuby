require 'spec_helper'

describe LinesToWeeksConverter do
  describe "Converts lines to weeks correctly" do
    it "Weeks are properly parsed" do
      lines = ["Week 1", "Week 2", "Week 3"]

      weeks = LinesToWeeksConverter.convert(lines)

      weeks.length.must_equal(lines.length)
    end

    it "Weeks with days are properly parsed" do
      week_lines = ["Week 1", "Week 2", "Week 3"]
      days_for_week = ["Monday 2016-12-05", "- first task", "Tuesday 2016-12-06"]

      lines = Array.new(week_lines)
      lines.insert(1, days_for_week).flatten!

      weeks = LinesToWeeksConverter.convert(lines)

      weeks.length.must_equal(week_lines.length)
      weeks[week_lines[0]].length.must_equal(days_for_week.length)
    end
  end

  describe "Incorrect initialization" do
    it "Incorrect arguments cause runtime error" do
      lambda {
          LinesToWeeksConverter.convert(nil)
        }.must_raise RuntimeError
    end
  end
end
