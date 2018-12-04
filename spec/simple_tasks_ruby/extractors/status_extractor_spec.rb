require 'spec_helper'

module SimpleTasksRuby
  describe StatusExtractor do
    describe "Defined statuses" do
      {
        "- DONE - first task"                                         => TaskStatus::DONE,
        "- delayed, - this is a delayed task"                         => TaskStatus::DELAYED,
        "- delayed, DONE 2016-05-01 - this is delayed, but done task" => TaskStatus::DELAYED_DONE,
        "- ABORTED - this is aborted task"                            => TaskStatus::ABORTED
      }.each do |action, task_status|
        it "Extracts status based on line prefix" do 
          status = act(action)
          status.status.must_equal task_status
        end
      end
    end

    it "Extract delayed and done has correct date" do
      action = "- delayed, DONE 2016-05-01 - this is delayed, but done task"

      status = act(action)

      status.date.must_equal "2016-05-01"
    end

    it "No status" do
      action = "- task without any status yet"

      status = act(action)

      status.status.wont_be_nil # returns not empty string but we don't care what is it exactly
    end

    it "Unexpected line - starting from two hyphens instead of one" do
      action = "-- books"

      status = act(action)

      status.status.wont_be_nil
    end

    private
      def act(text)
        StatusExtractor.extract_status(text)
      end
  end
end
