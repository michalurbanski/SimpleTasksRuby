require 'spec_helper' 

module SimpleTasksRuby
  describe EmptyLinesRemovalModule do 
    it 'Removes one empty line' do
      lines = []
      lines << FileLine.new(1, "test")
      lines << FileLine.new(2, "\n")

      act!(lines)

      lines.count.must_equal 1
      lines.first.line_number.must_equal 1
      lines.first.data.wont_be_empty
    end

    it 'Removes two empty lines' do
      lines = []
      lines << FileLine.new(1, "\n")
      lines << FileLine.new(2, "test")
      lines << FileLine.new(3, "\n")

      act!(lines)

      lines.count.must_equal 1
      lines.first.line_number.must_equal 2
      lines.first.data.wont_be_empty
    end

    it 'Removes all types of empty lines' do
      lines = []
      lines << FileLine.new(1, "\n")
      lines << FileLine.new(2, "")
      lines << FileLine.new(3, '')

      act!(lines)

      lines.must_be_empty
    end

    it 'Does not raise error when input array is empty' do
      lines = []

      act!(lines)

      lines.must_be_empty
    end

    it 'Raises error when input is nil' do
      lambda {
          act!(nil)
        }.must_raise ArgumentError
    end

    def act!(lines)
      EmptyLinesRemovalModule.remove_blank_lines!(lines)
    end
  end
end
