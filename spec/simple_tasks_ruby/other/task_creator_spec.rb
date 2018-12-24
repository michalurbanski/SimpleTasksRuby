require 'spec_helper'

module SimpleTasksRuby
  describe TaskCreator do
    it "Done task created" do
      action = "- DONE - first task"
      date = DateTime.new(2015, 3, 1)

      done_task = act(action, date)

      done_task.status.must_equal TaskType::DONE
    end

    it "Aborted task created" do
      action = "- ABORTED - first task"
      date = DateTime.new(2015, 3, 1)

      aborted_task = act(action, date)

      aborted_task.status.must_equal TaskType::ABORTED
    end

    it "Delayed task created" do
      action = "- delayed, - first task"
      date = DateTime.new(2015, 3, 1)

      delayed_task = act(action, date)

      delayed_task.status.must_equal TaskType::DELAYED
    end

    it "Delayed and done task created" do
      action = "- delayed, DONE 2016-03-03 - first task"
      date = DateTime.new(2015, 3, 1)

      done_task = act(action, date)
      
      done_task.status.must_equal TaskType::DELAYED_DONE
    end

    it "Delayed and done task has a greater done date than the original date" do
      # Task done 2 days later
      action = "- delayed, DONE 2015-03-03 - first task"
      date = DateTime.new(2015, 3, 1)

      done_task = act(action, date)

      (done_task.done_date > done_task.original_date).must_equal true
    end

    it "Not started task created" do
      action = "- this is not started task"
      date = DateTime.new(2015, 3, 1)

      not_started_task = act(action, date)

      not_started_task.status.must_equal TaskType::NOT_STARTED
    end

    def act(action, date)
      TaskCreator.new(action, date).create_task
    end
  end
end
