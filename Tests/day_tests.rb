require 'test/unit'
require_relative '../Models/day'

class DayTests < Test::Unit::TestCase
  def test_create_day_using_simple_constructor
    day = Day.new("Monday 2016-05-01")

    assert_equal("Monday 2016-05-01", day.name)
  end

  def test_day_should_have_date
    date = "2016-05-01"
    day = Day.new("Monday" + " " + date)

    assert_equal(Date.parse(date), day.date)
  end

  #def test_create_day_using_two_parameters_constructor
  #  day = Day.new("day", Array.new)
  #
  #  assert_equal("day", day.name)
  #  assert_equal(false, (day.respond_to? :actions))
  #end
end
