require 'spec_helper' 

describe EmptyLinesRemovalModule do 
  it 'removes one empty line - new line character' do
    lines = []
    lines << FileLine.new(1, "test")
    lines << FileLine.new(2, "\n")

    without_blank = act(lines)

    without_blank.count.must_equal 1
    without_blank.first.line_number.must_equal 1
    without_blank.first.data.wont_be_empty
  end

  it 'removes two empty lines - new line character' do
    lines = []
    lines << FileLine.new(1, "\n")
    lines << FileLine.new(2, "test")
    lines << FileLine.new(3, "\n")

    without_blank = act(lines)

    without_blank.count.must_equal 1
    without_blank.first.line_number.must_equal 2
    without_blank.first.data.wont_be_empty
  end

  it 'removes all types of empty lines' do
    lines = []
    lines << FileLine.new(1, "\n")
    lines << FileLine.new(2, "")
    lines << FileLine.new(3, '')

    without_blank = act(lines)

    without_blank.must_be_empty
  end

  it 'does not raise error when input array is empty' do
    lines = []

    without_blank = act(lines)

    without_blank.must_be_empty
  end

  it 'raises error when input is nil' do
    lambda {
        act(nil)
      }.must_raise ArgumentError
  end

  def act(lines)
    EmptyLinesRemovalModule.remove_blank_lines(lines)
  end
end
