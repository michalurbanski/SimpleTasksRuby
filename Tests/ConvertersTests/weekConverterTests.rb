require 'rubygems'
gem 'test-unit'
require 'test/unit'
require_relative '../../Converters/week_converter'

class WeekConverterTests < Test::Unit::TestCase
  class << self
    def startup
      @@test = "string"
      puts "runs only once"
      puts 'second line'
    end
  end

  def test_is_valid_end_of_week
    result = WeekConverter.is_end_of_week("---")
    assert_equal(true, result)
  end

  def test_two_hyphens_are_not_valid_end_of_week
    result = WeekConverter.is_end_of_week("--")
    assert_equal(false, result)
  end

  def test_convert_week_to_days
    assert_not_nil(@@test)

    lines = Array.new
    lines.push("Week 1")
    lines.push("Monday 2015-01-01")
    lines.push("- first task")
    lines.push("Tuesday 2015-01-02")

    weekConverter = WeekConverter.new(lines)
    weekConverter.convert_lines_to_week
    days = weekConverter.days

    assert_equal(2, days.length)
  end
end
