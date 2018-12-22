require 'spec_helper'

module SimpleTasksRuby
  describe DaysParser do
    describe "Parse lines to days" do
      it "Well formatted line is recognized as a day" do
        line = "Monday 2016-01-01"

        DaysParser.is_line_with_day(line).must_equal true
      end
    end

    describe "Not correct parsing to days" do
      it "Incorrect day name" do
        line = "Monda 2016-01-11"

        DaysParser.is_line_with_day(line).must_equal false
      end

      it "Incorrect date format" do
        line = "Monday 2016-01-1"

        DaysParser.is_line_with_day(line).must_equal false
      end
    end
  end
end
