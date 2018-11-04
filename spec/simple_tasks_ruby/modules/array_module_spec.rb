require 'spec_helper' 

describe ArrayModule do 

  describe 'Convert to hash' do 
    it 'Converts array to hash' do 
      a = ["line1", "line2"]

      result = ArrayModule.convert_to_hash_with_indices(a) 

      result.keys[0].must_equal 1
      result.keys[1].must_equal 2
    end
  end

  describe 'Is array of strings' do 
    it 'Object is not array of strings' do 
      a = Object.new

      result = act(a)

      result.must_equal false
    end

    it 'Checks if array of strings' do 
      a = ["line1", "line2"]

      result = act(a)

      result.must_equal true
    end

    it 'Array with objects is not array of strings' do 
      a = [Object.new]

      result = act(a)

      result.must_equal false
    end

    def act(array) 
      ArrayModule.array_of_strings?(array)
    end
  end
end
