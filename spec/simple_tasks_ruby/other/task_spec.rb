class TaskTests < Test::Unit::TestCase
  def test_task_after_creation_all_members_are_nil
    task = Task.new("- this is task", Date.new(2016, 1, 1))

    assert_not_nil(task.title)
    assert_equal(Date.new(2016, 1, 1), task.originalDate)
  end
end
