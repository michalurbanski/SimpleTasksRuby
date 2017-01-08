require 'spec_helper'

describe WeekConverter do
  # Runs code before each expectation
  before do
    # test data
    @lines = Array.new
    @lines.push("Week 1")
    @lines.push("Monday 2015-01-01")
    @lines.push("- first task")
    @lines.push("- second task")
    @lines.push("Tuesday 2015-01-02")

    @week_converter = WeekConverter.new @lines
  end

  describe "Determine end of the week" do
    it "End of the week is valid" do
      result = WeekConverter.is_end_of_week("---")
      result.must_equal true
      #result.must_be :==, true # this condition can also be written as
    end

    it "End of the week is not valid" do
      result = WeekConverter.is_end_of_week("--")
      result.must_equal false
    end
  end

  describe "Convert lines to week" do
    # it "convert lines to week should return week object" do
    #   week = @week_converter.convert_lines_to_week

    #   week.must_be_instance_of Week
    # end

    # it "converting lines to week should return week object with proper data" do
    #   week = @week_converter.convert_lines_to_week

    #   week.name.must_equal "Week 1"
    #   week.days.length.must_equal 2
    #   week.days[0].actions.length.must_equal 2
    # end

    # it "converted lines to week should have defined number of days" do
    #   week = @week_converter.convert_lines_to_week

    #   week.days.length.must_equal 2
    # end

    it "parse lines and convert them to days" do
      parsed_week = @week_converter.parse_week

      @week_converter.week.name.must_equal "Week 1"
      parsed_week.must_be_instance_of Hash
      parsed_week.keys.length.must_equal 2
    end
  end
end
