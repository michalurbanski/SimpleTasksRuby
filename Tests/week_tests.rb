require 'test/unit'
require_relative '../Models/week'

class WeekTest < Test::Unit::TestCase
  def test_week_creation_should_have_name
    week = Week.new("test")
    assert_equal("test", week.name)
  end

  def test_week_add_day_have_one_day_in_collection
    week = Week.new("test")
    week.add_day(1)

    assert_equal(1, week.days.count) # count property for number of array elements
    assert_equal(1, week.days[week.days.count-1])
  end
end