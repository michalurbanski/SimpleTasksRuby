require 'spec_helper'

module SimpleTasksRuby
  describe TaskCreator do
    it "Done task created" do
      date = DateTime.new(2015, 3, 1)
      action = "- DONE - first task"

      taskCreator = TaskCreator.new(action, date)
      doneTask = taskCreator.create_task

      doneTask.status.must_equal TaskType::DONE
    end

    it "Aborted task created" do
      date = DateTime.new(2015, 3, 1)
      action = "- ABORTED - first task"

      taskCreator = TaskCreator.new(action, date)
      abortedTask = taskCreator.create_task

      abortedTask.status.must_equal TaskType::ABORTED
    end

    it "Delayed task created" do
      date = DateTime.new(2015, 3, 1)
      action = "- delayed, - first task"

      taskCreator = TaskCreator.new(action, date)
      delayedTask = taskCreator.create_task

      delayedTask.status.must_equal TaskType::DELAYED
    end

    it "Delayed and done task created" do
      date = DateTime.new(2015, 3, 1)
      action = "- delayed, DONE 2016-03-03 - first task"

      taskCreator = TaskCreator.new(action, date)
      doneTask = taskCreator.create_task
      
      doneTask.status.must_equal TaskType::DELAYED_DONE
    end

    it "Delayed and done task has a greater done date than the original date" do
      date = DateTime.new(2015, 3, 1)

      # Task done 2 days later
      action = "- delayed, DONE 2015-03-03 - first task"

      taskCreator = TaskCreator.new(action, date)
      doneTask = taskCreator.create_task

      (doneTask.done_date > doneTask.original_date).must_equal true
    end
  end
end
