require 'spec_helper'

describe Task do
  before do
      @date = Date.new(2016,1, 1)
      @title = "- this is task"
  end

  describe "Base task" do
    it "When base task is created it has date and title" do
      task = Task.new(@title, @date)

      task.title.wont_be_nil
      task.title.must_equal @title
      task.original_date.must_equal @date
    end

    it "Base task has no additional properties" do 
      task = Task.new(@title, @date)

      task.properties.must_be_nil
    end
  end

  # describe "Delayed task" do
  #   it "Delayed tasks is a task" do
  #     delayedTask = DelayedTask.new(@title, @date)

  #     delayedTask.is_a?(Task).must_equal true
  #   end
  # end
end
