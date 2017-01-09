require 'spec_helper'

describe Task do
  before do
      @date = Date.new(2016,1, 1)
      @title = "- this is task"
  end

  describe "Base task" do
    it "Task when created has basic properties filled" do
      task = Task.new(@title, @date)

      task.title.wont_be_nil
      task.title.must_equal @title
      task.originalDate.must_equal @date
    end
  end

  describe "Delayed task" do
    it "Delayed tasks is a task" do
      delayedTask = DelayedTask.new(@title, @date)

      delayedTask.is_a?(Task).must_equal true
    end
  end
end
