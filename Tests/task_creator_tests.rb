require 'test/unit'
require_relative '../Models/done_task'
require_relative '../Creators/task_creator'

class TaskCreatorTests < Test::Unit::TestCase
  def test_done_task_created
    date = DateTime.new(2015, 3, 1)
    action = "DONE - first task"

    taskCreator = TaskCreator.new(action, date)
    doneTask = taskCreator.create_task

    assert_equal(true, doneTask.is_a?(DoneTask))
  end

  def test_aborted_task_created
    date = DateTime.new(2015, 3, 1)
    action = "ABORTED - first task"

    taskCreator = TaskCreator.new(action, date)
    abortedTask = taskCreator.create_task

    assert_equal(true, abortedTask.is_a?(AbortedTask))
  end

  def test_delayed_task_created
    date = DateTime.new(2015, 3, 1)
    action = "delayed, - first task"

    taskCreator = TaskCreator.new(action, date)
    delayedTask = taskCreator.create_task

    assert_equal(true, delayedTask.is_a?(DelayedTask))
  end

  # delayed and done should be treated also as done but
  # has a later date than original one
  def test_delayed_and_done_task_created
    date = DateTime.new(2015, 3, 1)
    action = "delayed, DONE 2016-03-03 - first task"

    taskCreator = TaskCreator.new(action, date)
    doneTask = taskCreator.create_task

    assert_equal(true, doneTask.is_a?(DoneTask))
  end
end
