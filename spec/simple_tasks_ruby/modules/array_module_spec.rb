require 'spec_helper' 

module SimpleTasksRuby
  describe ArrayModule do 

    describe 'Convert to hash' do 
      it 'Converts array to hash' do 
        a = ["line1", "line2"]

        result = ArrayModule.convert_to_hash_with_indices(a) 

        result.keys[0].must_equal 1
        result.keys[1].must_equal 2
      end
    end
  end
end
