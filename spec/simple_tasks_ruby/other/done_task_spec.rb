require 'spec_helper'

describe Task do
  before do
    @date = Date.new(2016, 2, 2)
    @title = "DONE - this is done task"
  end

  describe "Done task" do
    it "When done task is created it has date and title" do
      task = Task.new(@title, @date)

      task.title.wont_be_nil
      task.title.must_equal @title
      task.original_date.must_equal @date
    end

    it "Done task has additional properties" do 
      properties = SimpleTasksRuby::DoneTaskProperties.new
      task = Task.new(@title, @date, properties)

      task.properties.wont_be_nil
      task.properties.status.must_equal SimpleTasksRuby::TaskType::DONE
    end
  end

  describe "Delayed and then done task" do
    it "Task had been delayed but it was done" do
      done_date = @date + 2
      properties = SimpleTasksRuby::DelayedDoneTaskProperties.new(done_date)
      task = Task.new(@title, @date, properties)

      task.properties.wont_be_nil
      task.properties.status.must_equal SimpleTasksRuby::TaskType::DELAYED_DONE
      task.properties.done_date.must_equal done_date
    end
  end

  describe "Delayed task" do
    it "Delayed task has no done date" do
      properties = SimpleTasksRuby::DelayedTaskProperties.new
      task = Task.new(@title, @date, properties)

      task.properties.wont_be_nil
      task.properties.status.must_equal SimpleTasksRuby::TaskType::DELAYED
      task.properties.wont_respond_to :done_date
    end
  end
end
