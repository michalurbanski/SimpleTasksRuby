require 'test/unit'
require_relative '../../Converters/LinesConverter'

class LinesConverterTests < Test::Unit::TestCase
  def test_removes_one_empty_line
    lines = ["test", "\n"]

    linesConverter = LinesConverter.new(lines)
    withoutBlank = linesConverter.remove_blank_lines

    assert_equal(1, withoutBlank.count)
    assert_equal("test", withoutBlank[0])
  end

  def test_remove_two_empty_lines
    lines = ["test", "\n", "\n"]
    linesConverter = LinesConverter.new(lines)
    withoutBlank = linesConverter.remove_blank_lines

    assert_equal(1, withoutBlank.count)
    assert_equal("test", withoutBlank[0])
  end
end
