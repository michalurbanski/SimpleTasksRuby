require 'spec_helper'

module SimpleTasksRuby
  describe TasksFinder do
    let(:lines) do
      lines = Array.new
      lines << FileLine.new(1, "Week 1")
      lines << FileLine.new(2, "Monday 2018-01-01")
      lines << FileLine.new(3, "- delayed, - First task")
    end

    it "Finds delayed tasks when one exists" do
      tasks = get_tasks(lines)

      tasks_finder = TasksFinder.new(tasks)
      delayed_tasks = tasks_finder.find_tasks_by_status(TaskType::DELAYED)
      
      delayed_tasks.length.must_equal 1
    end

    it "For empty list of tasks returns nil" do
      tasks = get_tasks(Array.new)

      tasks_finder = TasksFinder.new(tasks)
      delayed_tasks = tasks_finder.find_tasks_by_status(TaskType::DELAYED)
    
      delayed_tasks.must_be_nil
    end

    it "For nil list of tasks returns nil" do
      tasks = get_tasks(nil)

      tasks_finder = TasksFinder.new(tasks)
      delayed_tasks = tasks_finder.find_tasks_by_status(TaskType::DELAYED)

      delayed_tasks.must_be_nil
    end

    describe "Integration tests" do
      it "Finds delayed tasks in one week" do
        lines = TestDataReader.read_single_week
        
        tasks = get_tasks(lines)
        tasks_finder = TasksFinder.new(tasks)
        delayed_tasks = tasks_finder.find_tasks_by_status(TaskType::DELAYED)
        
        delayed_tasks.length.must_equal 3
      end

      it "Finds delayed tasks in multiple weeks" do
        lines = TestDataReader.read_multiple_weeks
        
        tasks = get_tasks(lines)
        tasks_finder = TasksFinder.new(tasks)
        delayed_tasks = tasks_finder.find_tasks_by_status(TaskType::DELAYED)
        
        delayed_tasks.length.must_equal 4
      end
    end

    private
      def get_tasks(lines)
        tasks_manager = TasksManager.new(lines)
        tasks_manager.group_by_status
        tasks = tasks_manager.tasks_grouped_by_status

        return tasks
      end
  end
end
