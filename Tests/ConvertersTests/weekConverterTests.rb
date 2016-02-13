require 'test/unit'
require_relative '../../Converters/weekConverter'

class WeekConverterTests < Test::Unit::TestCase
  def test_is_valid_end_of_week
    result = WeekConverter.is_end_of_week("---")
    assert_equal(true, result)
  end

  def test_two_hyphens_are_not_valid_end_of_week
    result = WeekConverter.is_end_of_week("--")
    assert_equal(false, result)
  end
end
