require 'test/unit'
require_relative '../Models/task'

class TaskTests < Test::Unit::TestCase
  def test_task_after_creation_all_members_are_nil
    task = Task.new("- this is task")

    assert_equal(nil, task.status)
    assert_equal(nil, task.title)
    assert_equal(nil, task.isDoneOnTime)
  end
end
