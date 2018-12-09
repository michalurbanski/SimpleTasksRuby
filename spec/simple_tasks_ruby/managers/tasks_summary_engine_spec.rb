require 'spec_helper'

module SimpleTasksRuby
  describe TasksSummaryEngine do
    describe "Positive cases" do
      it "Returns task count of delayed tasks" do
        tasks_hash = {}
        
        first_task = Task.new("title", Date.new(2017, 1, 1), {status: TaskType::DELAYED})
        second_task = Task.new("second", Date.new(2017, 1, 2), {status: TaskType::DELAYED})
        
        tasks = [first_task, second_task]
        tasks_hash[TaskType::DELAYED] = tasks

        tasks_summary_engine = TasksSummaryEngine.new(tasks_hash)
        tasks_summary_engine.calculate
        tasks_summary_engine.total.must_equal 2
      end

      it "Returns tasks count by status" do
        tasks_hash = {}
        
        first_task = Task.new("title", Date.new(2017, 1, 1), 
          {status: TaskType::DELAYED})
        second_task = Task.new("second", Date.new(2017, 1, 2), 
          {status: TaskType::DELAYED})
        aborted_task = Task.new("aborted", Date.new(2017, 1, 3), 
          {status: TaskType::ABORTED})
        
        tasks_hash[TaskType::DELAYED] = [first_task, second_task]
        tasks_hash[TaskType::ABORTED] = [aborted_task]

        tasks_summary_engine = TasksSummaryEngine.new(tasks_hash)
        tasks_summary_engine.calculate
        tasks_count_by_status = tasks_summary_engine.tasks_count_by_status

        tasks_count_by_status.length.must_equal 2 # There are delayed and aborted tasks
        tasks_count_by_status[TaskType::DELAYED].must_equal 2
        tasks_count_by_status[TaskType::ABORTED].must_equal 1
      end
    end

    describe "Negative cases" do
      it "Nil list of tasks returns total of zero" do
        tasks_summary_engine = TasksSummaryEngine.new(nil)
        
        tasks_summary_engine.calculate
        
        tasks_summary_engine.total.must_equal 0
      end

      it "Empty list of tasks returns total of zero" do
        tasks_summary_engine = TasksSummaryEngine.new({})

        tasks_summary_engine.calculate

        tasks_summary_engine.total.must_equal 0
      end
    end
  end
end
