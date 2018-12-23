require 'spec_helper' 

module SimpleTasksRuby
  describe ArrayModule do 
    describe 'Convert to hash with indices' do
      it 'Converts array to hash' do 
        a = ["line1", "line2"]
        
        result = ArrayModule.convert_to_hash_with_indices(a) 
        
        result.keys[0].must_equal 1
        result.keys[1].must_equal 2
      end

      it 'Empty array is converted to empty hash' do
        result = ArrayModule.convert_to_hash_with_indices([])

        result.must_be_empty
        result.must_be_kind_of Hash
      end
    end

    describe 'Check if array is nil or empty' do
      it 'Is array nil?' do
        result = ArrayModule.is_nil_or_empty?(nil)

        result.must_equal true
      end

      it 'Is array empty?' do
        result = ArrayModule.is_nil_or_empty?([])

        result.must_equal true
      end
    end
  end
end
