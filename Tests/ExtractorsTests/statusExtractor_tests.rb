require 'test/unit'
require_relative '../../Extractors/status_extractor'
require_relative '../../Modules/task_status'

class StatusExtractorTests < Test::Unit::TestCase
  def test_extract_done_status
    action = "- DONE - first task"

    extractor = StatusExtractor.new(action)
    status = extractor.extract_status

    assert_equal(TaskStatus::DONE, status)
  end

  def test_extract_delayed_and_not_done_status
    action = "- delayed, - this is delayed task"

    extractor = StatusExtractor.new(action)
    status = extractor.extract_status

    assert_equal(TaskStatus::DELAYED, status)
  end

  def test_extract_delayed_and_done_status
    action = "- delayed, DONE - this is delayed, but done task"

    extractor = StatusExtractor.new(action)
    status = extractor.extract_status

    assert_equal(TaskStatus::DELAYED_DONE, status)
  end

  def test_extract_aborted_status
    action = "- ABORTED - this is aborted task"

    extractor = StatusExtractor.new(action)
    status = extractor.extract_status

    assert_equal(TaskStatus::ABORTED, status)
  end

  def test_no_status
    action = "- task without any status yet"

    extractor = StatusExtractor.new(action)
    status = extractor.extract_status

    assert_not_nil(status) # returns not empty string but we don't care what is it exactly
  end
end

