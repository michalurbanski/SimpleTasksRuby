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
end
