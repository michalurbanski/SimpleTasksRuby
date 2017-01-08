require 'spec_helper'

describe Day do
  describe "Day tests" do
    before do # runs before each test
      @name = "Monday 2016-05-01"
      @day = Day.new(@name)
    end

    it "Created day has name" do
      @day.name.must_equal @name
    end

    it "Day has proper date" do
      @day.date.must_equal Date.parse("2016-05-01")
    end

    it "Day allows to add tasks" do
      @day.add_task("First task")

      @day.length.must_equal 1
    end

    it "Day can have no tasks" do
      @day.length.must_equal 0
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

