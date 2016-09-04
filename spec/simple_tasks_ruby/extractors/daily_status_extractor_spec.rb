class DailyStatusExtractorTests < Test::Unit::TestCase
  def test_proceed_day_actions_number_equals_tasks_number
    day = Day.new("Monday 2016-05-01")
    day.add_action("- First action")
    day.add_action("delayed, - Second action")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    tasks = daily_status_extractor.daily_tasks

    assert_equal(2, tasks.length)
  end

  def test_proceed_day_results_are_tasks
    day = Day.new("Monday 2016-05-01")
    day.add_action("- First action")
    day.add_action("delayed, - Second action")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    tasks = daily_status_extractor.daily_tasks

    tasks.each do |task|
      assert_kind_of(Task, task)
    end
  end

  def test_task_have_planned_date
    dayDate = "2016-05-01"
    day = Day.new("Monday" + " " + dayDate)

    # All types of tasks, except of done ones - each should have original date set
    day.add_action("- First action")
    day.add_action("- delayed, DONE 2016-05-13 - this is delayed and done task")
    day.add_action("- delayed, - this is delayed task")
    day.add_action("- ABORTED - this is aborted task")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    tasks = daily_status_extractor.daily_tasks

    # Each task has the same original date
    tasks.each do |task|
      assert_equal(Date.parse(dayDate), task.originalDate)
    end
  end
end
