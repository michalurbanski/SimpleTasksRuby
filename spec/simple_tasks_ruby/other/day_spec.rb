require 'spec_helper'

describe Day do
  describe "Day tests" do
    before do
      @name = "Monday 2016-05-01"
    end

    it "Created day has name" do
      day = Day.new(@name)

      day.name.must_equal @name
    end

    it "Day has proper date" do
      day = Day.new(@name)

      day.date.must_equal Date.parse("2016-05-01")
    end
  end

  describe "Day incorrect data" do
    it "Day not initialized with date can't be created" do
      lambda {
        day = Day.new("Monday")
      }.must_raise NoDateException
    end

    it "Day initialized with not correct date can't be created" do
      lambda {
        day = Day.new("Monday 2016-05-44")
      }.must_raise IncorrectDateForDayException
    end
  end
end

#   def test_day_has_tasks_equal_to_actions
#     day = Day.new("Monday 2016-05-12")
#     day.add_action("- First action")
#     day.add_action("- delayed, - Second action")

#     daily_status_extractor = DailyStatusExtractor.new(day)
#     daily_status_extractor.proceed_day

#     dailyTasks = daily_status_extractor.daily_tasks
#     day.add_tasks(dailyTasks)

#     assert_equal(day.actions.length, day.tasks.length)
#   end

