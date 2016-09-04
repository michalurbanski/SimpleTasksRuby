class TasksManagerTests < Test::Unit::TestCase
  def test_find_delayed_tasks

    #TODO: extract creating sample day to another class or module
    day = Day.new("Monday 2016-05-20")
    day.add_action("- delayed, - first task")
    day.add_action("- DONE - second task")
    day.add_action("- delayed, - third task")
    day.add_action("- new task")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    tasks = daily_status_extractor.daily_tasks
    day.add_tasks(tasks)

    tasks_manager = TasksManager.new
    delayed_tasks = tasks_manager.find_delayed_tasks(day.tasks)

    assert_equal(2, delayed_tasks.length)
  end
end
