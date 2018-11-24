require 'spec_helper'

module SimpleTasksRuby
  describe PossibleDaysTester do
    it "Is valid possible day" do
      tester = PossibleDaysTester.new
      text = "Monday"

      tester.is_day(text).must_equal true
    end

    it "Is valid possible day mixed casing" do
      tester = PossibleDaysTester.new
      text = "mONday"

      tester.is_day(text).must_equal true
    end

    it "Is not valid day" do
      tester = PossibleDaysTester.new
      text = "aaa"

      tester.is_day(text).must_equal false
    end
  end
end
