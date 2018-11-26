require 'spec_helper'

module SimpleTasksRuby
  describe StatusExtractor do
    it "Extract done status" do
      action = "- DONE - first task"

      status = act(action)

      status.status.must_equal TaskStatus::DONE
    end

    it "Extract delayed and not done status" do
      action = "- delayed, - this is delayed task"

      status = act(action)

      status.status.must_equal TaskStatus::DELAYED
    end

    it "Extract delayed and done stauts" do
      action = "- delayed, DONE 2016-05-01 - this is delayed, but done task"

      status = act(action)

      status.status.must_equal TaskStatus::DELAYED_DONE
    end

    it "Extract delayed and done has correct date" do
      action = "- delayed, DONE 2016-05-01 - this is delayed, but done task"

      status = act(action)

      status.date.must_equal "2016-05-01"
    end

    it "Extract aborted status" do
      action = "- ABORTED - this is aborted task"

      status = act(action)

      status.status.must_equal TaskStatus::ABORTED
    end

    it "No status" do
      action = "- task without any status yet"

      status = act(action)

      status.status.wont_be_nil # returns not empty string but we don't care what is it exactly
    end

    it "Unexpected line" do
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
