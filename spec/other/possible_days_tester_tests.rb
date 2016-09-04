require 'test/unit'
require_relative '../Models/possible_days_tester'

class PossibleDaysTesterTests < Test::Unit::TestCase
  def test_is_valid_possible_day
    tester = PossibleDaysTester.new
    text = "Monday"

    assert_equal(true, tester.is_day(text))
  end

  def test_is_valid_possible_day_weird_case
    tester = PossibleDaysTester.new
    text = "mONday"

    assert_equal(true, tester.is_day(text))
  end

  def test_is_not_valid_day
    test = PossibleDaysTester.new
    text = "aaa"

    assert_equal(false, test.is_day(text))
  end

  def test_is_friday_a_day
    test = PossibleDaysTester.new
    text = "Friday"

    assert_equal(true, test.is_day(text))
  end
end
