require 'spec_helper' 

describe TasksManager do 
  before do 
    @tasks_manager = TasksManager.new
    @weeks_manager = WeeksManager.new
  end

  describe "Positive cases" do 
    it "Gets all tasks information" do 
      lines = TestDataReader.read_multiple_weeks
      weeks = @weeks_manager.convert_data_to_weeks(lines)
      all_tasks_information = @tasks_manager.get_all_tasks_information(weeks)

      all_tasks_information.length.must_equal(4) # verify
      all_tasks_information[:delayed_tasks].length.must_equal(4) 
      all_tasks_information[:aborted_tasks].length.must_equal(1)
      all_tasks_information[:done_tasks].length.must_equal(3) 
      all_tasks_information[:awaiting_tasks].length.must_equal(3)
    end   

    it "Finds delayed tasks when one exists" do 
      delayed_task = Task.new('title', DateTime.now, {status: SimpleTasksRuby::TaskType::DELAYED})
      aborted_task = Task.new('aborted', DateTime.now, {status: SimpleTasksRuby::TaskType::ABORTED})

      tasks = [delayed_task, aborted_task]

      @tasks_manager.find_delayed_tasks(tasks).length.must_equal 1
    end

    it "Finds delayed tasks in one week" do 
      lines = TestDataReader.read_single_week
      delayed_tasks = act(lines)

      delayed_tasks.length.must_equal 3
    end

    it "Finds delayed tasks in multiple weeks" do 
      lines = TestDataReader.read_multiple_weeks
      delayed_tasks = act(lines)

      delayed_tasks.length.must_equal 4
    end

    def act(lines) 
      weeks = @weeks_manager.convert_data_to_weeks(lines)

      delayed_tasks = @tasks_manager.find_delayed_tasks_in_multiple_weeks(weeks) 
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
