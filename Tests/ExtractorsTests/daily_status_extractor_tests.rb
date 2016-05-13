require 'test/unit'

require_relative '../../Extractors/daily_status_extractor'

class DailyStatusExtractorTests < Test::Unit::TestCase
  def test_proceed_day_actions_are_converted_to_tasks
    day = Day.new("Monday")
    day.add_action("- First action")
    day.add_action("delayed, - Second action")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    tasks = daily_status_extractor.daily_tasks

    assert_equal(2, tasks.length)
  end
end
