require 'spec_helper' 

describe EmptyLinesRemovalModule do 
  describe 'Positive cases' do 
    it 'removes one empty line' do 
      lines = ["test", "\n"]

      without_blank = EmptyLinesRemovalModule.remove_blank_lines(lines)

      without_blank.count.must_equal(1) 
      without_blank[0].must_equal('test') 
    end

    it 'removes two empty lines' do 
      lines = ["test", "\n", "\n"]

      without_blank = EmptyLinesRemovalModule.remove_blank_lines(lines) 

      without_blank.count.must_equal(1) 
      without_blank[0].must_equal('test')
    end
  end 
end
