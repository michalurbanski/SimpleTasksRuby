require "spec_helper" 

module SimpleTasksHelper
  describe SimpleTasksRuby::WeeksManager do
    let(:weeks_manager) { SimpleTasksRuby::WeeksManager.new }

    describe "Real input file with test data" do 
      before do 
        @lines = TestDataReader.read_multiple_weeks
      end

      # This test reads test data from disk
      it "Reads test data with 2 weeks and first day with 3 tasks" do 
        weeks_manager.convert_data_to_weeks(@lines) 

        weeks = weeks_manager.weeks

        weeks.length.must_equal 2
        weeks.first.days.first.tasks.length.must_equal 3
      end
    end

    describe "Invalid cases" do 
      it "Weeks are nil for empty input" do 
        lines = Array.new
        weeks_manager.convert_data_to_weeks(lines)

        weeks_manager.weeks.must_be_nil
      end 

      it "Weeks are nil for nil input" do 
        weeks_manager.convert_data_to_weeks(nil) 

        weeks_manager.weeks.must_be_nil
      end
    end 
  end
end
