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

      it "Tasks are grouped by all statuses" do
        lines = Array.new
        lines << FileLine.new(1, "Week 1")
        lines << FileLine.new(2, "Monday 2018-01-01")
        lines << FileLine.new(3, "- First task")
        lines << FileLine.new(4, "- delayed, - second task")
        lines << FileLine.new(5, "- delayed, DONE 2018-01-02 - delayed and done")
        lines << FileLine.new(6, "- DONE - done task")
        lines << FileLine.new(7, "- ABORTED - this is aborted task")

        tasks_manager = TasksManager.new(lines)
        tasks_manager.group_by_status
        tasks_grouped_by_status = tasks_manager.tasks_grouped_by_status

        tasks_grouped_by_status.each do |group_status, tasks|
          tasks.length.must_equal 1
        end
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
  end
end
