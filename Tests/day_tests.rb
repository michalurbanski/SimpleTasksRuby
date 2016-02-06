require 'test/unit'
require_relative '../Models/day'

class DayTests < Test::Unit::TestCase
  def test_create_day_using_simple_constructor
    day = Day.new("day")

    assert_equal("day", day.name)
  end

  #def test_create_day_using_two_parameters_constructor
  #  day = Day.new("day", Array.new)
  #
  #  assert_equal("day", day.name)
  #  assert_equal(false, (day.respond_to? :actions))
  #end
end
