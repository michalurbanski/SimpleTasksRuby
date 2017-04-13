require 'spec_helper' 

describe TasksManager do 
  before do 
    @tasks_manager = TasksManager.new
  end

  describe "Positive cases" do 
    it "Finds delayed tasks when one exists" do 
      delayed_task = DelayedTask.new('title', DateTime.now) 
      aborted_task = AbortedTask.new('aborted', DateTime.now)

      tasks = [delayed_task, aborted_task]

      @tasks_manager.find_delayed_tasks(tasks).length.must_equal(1)
    end

    it "Finds delayed tasks in one week" do 
      week = nil 

      delayed_tasks = @tasks_manager.find_delayed_tasks_in_week(week)

      delayed_tasks.wont_be_empty
    end

    it "Finds delayed tasks in multiple weeks" do 
      weeks = nil

      delayed_tasks = @tasks_manager.find_delayed_tasks_in_multiple_weeks(weeks) 

      delayed_tasks.wont_be_empty
    end
  end

  describe "Negative cases" do 
    it "When tasks list is nil then result is nil" do 
      tasks = nil
  
      @tasks_manager.find_delayed_tasks(tasks).must_be_nil 
    end

    it "When tasks list is empty then result is nil" do 
      tasks = Array.new

      @tasks_manager.find_delayed_tasks(tasks).must_be_nil
    end
  end
end
