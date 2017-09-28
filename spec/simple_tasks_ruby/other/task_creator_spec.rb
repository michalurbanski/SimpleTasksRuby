class TaskCreatorTests < Test::Unit::TestCase
  def test_done_task_created
    date = DateTime.new(2015, 3, 1)
    action = "- DONE - first task"

    taskCreator = TaskCreator.new(action, date)
    doneTask = taskCreator.create_task

    assert_equal(SimpleTasksRuby::TaskType::DONE, doneTask.status)
  end

  def test_aborted_task_created
    date = DateTime.new(2015, 3, 1)
    action = "- ABORTED - first task"

    taskCreator = TaskCreator.new(action, date)
    abortedTask = taskCreator.create_task

    assert_equal(SimpleTasksRuby::TaskType::ABORTED, abortedTask.status)
  end

  def test_delayed_task_created
    date = DateTime.new(2015, 3, 1)
    action = "- delayed, - first task"

    taskCreator = TaskCreator.new(action, date)
    delayedTask = taskCreator.create_task

    assert_equal(SimpleTasksRuby::TaskType::DELAYED, delayedTask.status)
  end

  # delayed and done should be treated also as done but
  # has a later date than original one
  def test_delayed_and_done_task_created
    date = DateTime.new(2015, 3, 1)
    action = "- delayed, DONE 2016-03-03 - first task"

    taskCreator = TaskCreator.new(action, date)
    doneTask = taskCreator.create_task
    
    assert_equal(SimpleTasksRuby::TaskType::DELAYED_DONE, doneTask.status)
  end

  def test_delayed_and_done_task_has_greater_done_date_than_original_date
    date = DateTime.new(2015, 3, 1)

    # Task done 2 days later
    action = "- delayed, DONE 2016-03-03 - first task"

    taskCreator = TaskCreator.new(action, date)
    doneTask = taskCreator.create_task

    assert_equal(true, doneTask.done_date > doneTask.original_date)
  end
end
