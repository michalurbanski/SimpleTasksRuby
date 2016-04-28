require 'rubygems'
gem 'test-unit'
require 'test/unit'
require_relative '../../Converters/week_converter'

class WeekConverterTests < Test::Unit::TestCase
  class << self
    # Startup method runs only once for each test suite
    def startup
      # test data
      @@lines = Array.new
      @@lines.push("Week 1")
      @@lines.push("Monday 2015-01-01")
      @@lines.push("- first task")
      @@lines.push("Tuesday 2015-01-02")
    end
  end

  # End of week should have at least three hyphens
  def test_is_valid_end_of_week
    result = WeekConverter.is_end_of_week("---")
    assert_equal(true, result)
  end

  def test_two_hyphens_are_not_valid_end_of_week
    result = WeekConverter.is_end_of_week("--")
    assert_equal(false, result)
  end

  def test_convert_lines_to_week_should_return_week_object
    weekConverter = WeekConverter.new(@@lines)
    week = weekConverter.convert_lines_to_week

    assert(week.is_a?(Week))
  end

  # Week should have name, days and actions in day
  def test_convert_lines_to_week_should_return_week_with_proper_date
    weekConverter = WeekConverter.new(@@lines)
    week = weekConverter.convert_lines_to_week

    assert_equal("Week 1", week.name)
    assert_equal(2, week.days.length)
    assert_equal(1, week.days[0].actions)
  end

  def test_parse_week_should_return_proper_data
    weekConverter = WeekConverter.new(@@lines)
    parsed_week = weekConverter.parse_week

    #assert_equal("Week 1", weekConverter.week_name)
    assert_equal(2, parsed_week.length)
  end

end
