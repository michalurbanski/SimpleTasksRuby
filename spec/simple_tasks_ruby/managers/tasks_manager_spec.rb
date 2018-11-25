require 'spec_helper' 

module SimpleTasksRuby
  describe TasksManager do 
    describe "New tests" do
      it "Tasks are grouped by status" do
        lines = Array.new
        lines << FileLine.new(1, "Week 1")
        lines << FileLine.new(2, "Monday 2018-01-01")
        lines << FileLine.new(3, "- First task")
        manager = TasksManager.new(lines)
        
        manager.group_by_status
        tasks = manager.tasks_grouped_by_status
        
        tasks.wont_be_empty
      end

      it "For empty lines collection tasks are nil" do
        lines = Array.new

        manager = TasksManager.new(lines)
        manager.group_by_status
        tasks = manager.tasks_grouped_by_status

        tasks.must_be_nil
      end

      it "If lines collection is nil then tasks are nil" do
        lines = nil
        
        manager = TasksManager.new(lines)
        manager.group_by_status
        tasks = manager.tasks_grouped_by_status

        tasks.must_be_nil
      end
    end

    # describe "Positive cases" do 
    #   it "Finds delayed tasks when one exists" do 
    #     delayed_task = Task.new('title', DateTime.now, {status: TaskType::DELAYED})
    #     aborted_task = Task.new('aborted', DateTime.now, {status: TaskType::ABORTED})

    #     tasks = [delayed_task, aborted_task]

    #     tasks_manager.find_tasks_by_status(tasks, TaskType::DELAYED).length.must_equal 1
    #   end

    #   it "Get tasks grouped by status - tasks are grouped" do 
    #     # constants property gets all consts defined in a module
    #     all_statuses = TaskType.constants # array of statuses from module

    #     tasks = Array.new

    #     # creates one task of each type
    #     all_statuses.each do |status|
    #       tasks << Task.new(status.to_s, DateTime.now, {status: status})
    #     end

    #     tasks_manager.get_tasks_grouped_by_status(tasks)
    #     tasks_manager.tasks_grouped_by_status.length.must_equal tasks.length
    #   end

    #   it "Tasks grouped by status is hash with keys which are task types" do
    #     delayed_task = Task.new('title', DateTime.now, {status: TaskType::DELAYED})
    #     aborted_task = Task.new('aborted', DateTime.now, {status: TaskType::ABORTED})
    #     done_task = Task.new('donetask', DateTime.now, {status:
    #       TaskType::DONE})
    #     delayed_but_done_task = Task.new('delayed_but_done', DateTime.now, {status: TaskType::DELAYED_DONE})

    #     tasks = [delayed_task, aborted_task, done_task, delayed_but_done_task]

    #     tasks_grouped_by_status = tasks_manager.get_tasks_grouped_by_status(tasks)

    #     tasks_grouped_by_status.each do |group_status, tasks|
    #       tasks.length.must_equal 1
    #     end
    #   end
    # end

    # describe "Integration tests" do
    #   it "Finds delayed tasks in one week" do 
    #     lines = TestDataReader.read_single_week

    #     delayed_tasks = act(lines)

    #     delayed_tasks.length.must_equal 3
    #   end

    #   it "Finds delayed tasks in multiple weeks" do 
    #     lines = TestDataReader.read_multiple_weeks
    #     delayed_tasks = act(lines)

    #     delayed_tasks.length.must_equal 4
    #   end

    #   def act(lines) 
    #     weeks = weeks_manager.convert_data_to_weeks(lines)
        
    #     return tasks_manager.find_tasks_by_status_in_weeks(weeks, TaskType::DELAYED)
    #   end
    # end

    # describe "Negative cases" do 
    #   it "When tasks list is nil then result is nil" do 
    #     tasks = nil
    
    #     tasks_manager.find_tasks_by_status(tasks, TaskType::DELAYED).must_be_nil 
    #   end

    #   it "When tasks list is empty then result is nil" do 
    #     tasks = Array.new

    #     tasks_manager.find_tasks_by_status(tasks, TaskType::DELAYED).must_be_nil
    #   end
    # end
  end
end
