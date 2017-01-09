require 'spec_helper'

describe Day do
  subject { day }

  describe "Day tests" do
    # http://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/
    let(:name) {"Monday 2016-05-01"}
    let(:day) { Day.new(name) }

    it "Created day has name" do
      subject.name.must_equal name
    end

    it "Day has proper date" do
      subject.date.must_equal Date.parse("2016-05-01")
    end

    it "Day has no tasks when created" do
      subject.length.must_equal 0
    end

    it "Day allows to add tasks" do
      task = Task.new("Title", Date.new(2016, 1,1))
      subject.add_task(task)

      subject.length.must_equal 1
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

    it "Day can have only tasks instances added" do
      day = Day.new("Monday 2016-05-01")

      lambda{
        day.add_task("test")
      }.must_raise ArgumentError
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

