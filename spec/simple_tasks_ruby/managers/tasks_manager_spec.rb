require 'spec_helper' 

module SimpleTasksHelper
  describe TasksManager do 
    let(:tasks_manager) { TasksManager.new }
    let(:weeks_manager) { SimpleTasksRuby::WeeksManager.new }

    describe "Positive cases" do 
      it "Finds delayed tasks when one exists" do 
        delayed_task = Task.new('title', DateTime.now, {status: SimpleTasksRuby::TaskType::DELAYED})
        aborted_task = Task.new('aborted', DateTime.now, {status: SimpleTasksRuby::TaskType::ABORTED})

        tasks = [delayed_task, aborted_task]

        tasks_manager.find_delayed_tasks(tasks).length.must_equal 1
      end

      it "Get tasks grouped by status" do 
        # constants property gets all consts defineid in a module
        all_statuses = SimpleTasksRuby::TaskType.constants # array of statuses from module

        tasks = Array.new

        # creates one task of each type
        all_statuses.each do |status|
          tasks << Task.new(status.to_s, DateTime.now, {status: status})
        end

        tasks_manager.get_tasks_grouped_by_status(tasks).length.must_equal tasks.length   
      end

      it "Tasks grouped by status is hash with keys which are task types" do
        delayed_task = Task.new('title', DateTime.now, {status: SimpleTasksRuby::TaskType::DELAYED})
        aborted_task = Task.new('aborted', DateTime.now, {status: SimpleTasksRuby::TaskType::ABORTED})
        done_task = Task.new('donetask', DateTime.now, {status:
          SimpleTasksRuby::TaskType::DONE})
        delayed_but_done_task = Task.new('delayed_but_done', DateTime.now, {status: SimpleTasksRuby::TaskType::DELAYED_DONE})

        tasks = [delayed_task, aborted_task, done_task, delayed_but_done_task]

        tasks_grouped_by_status = tasks_manager.get_tasks_grouped_by_status(tasks)

        tasks_grouped_by_status.each do |group_status, tasks|
          tasks.length.must_equal 1
        end
      end
    end

    describe "Integration tests" do
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
        weeks = weeks_manager.convert_data_to_weeks(lines)

        return tasks_manager.find_tasks_by_status_in_weeks(weeks, SimpleTasksRuby::TaskType::DELAYED)
      end
    end

    describe "Negative cases" do 
      it "When tasks list is nil then result is nil" do 
        tasks = nil
    
        tasks_manager.find_delayed_tasks(tasks).must_be_nil 
      end

      it "When tasks list is empty then result is nil" do 
        tasks = Array.new

        tasks_manager.find_delayed_tasks(tasks).must_be_nil
      end
    end
  end
end
