require 'test/unit'
require_relative '../../Extractors/statusExtractor'

class StatusExtractorTests < Test::Unit::TestCase
  def test_extract_done_status
    action = "- DONE - first task"

    extractor = StatusExtractor.new(action)
    status = extractor.extractStatus

    assert_equal("DONE", status)
  end

  def test_extract_delayed_and_not_done_status
    action = "- delayed, - this is delayed task"

    extractor = StatusExtractor.new(action)
    status = extractor.extractStatus

    assert_equal("delayed, -", status)
  end
end

