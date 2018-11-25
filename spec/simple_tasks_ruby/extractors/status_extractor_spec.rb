require 'spec_helper'

module SimpleTasksRuby
  describe StatusExtractor do
    it "Extract done status" do
      action = "- DONE - first task"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.status.must_equal TaskStatus::DONE
    end

    it "Extract delayed and not done status" do
      action = "- delayed, - this is delayed task"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.status.must_equal TaskStatus::DELAYED
    end

    it "Extract delayed and done stauts" do
      action = "- delayed, DONE 2016-05-01 - this is delayed, but done task"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.status.must_equal TaskStatus::DELAYED_DONE
    end

    it "Extract delayed and done has correct date" do
      action = "- delayed, DONE 2016-05-01 - this is delayed, but done task"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.date.must_equal "2016-05-01"
    end

    it "Extract aborted status" do
      action = "- ABORTED - this is aborted task"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.status.must_equal TaskStatus::ABORTED
    end

    it "No status" do
      action = "- task without any status yet"

      extractor = StatusExtractor.new(action)
      status = extractor.extract_status

      status.status.wont_be_nil # returns not empty string but we don't care what is it exactly
    end
  end
end
