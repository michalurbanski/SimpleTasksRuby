require 'spec_helper' 

describe ArrayModule do 
  it 'Converts array to hash' do 
    a = Array.new
    a << "line1" 
    a << "line2" 

    result = ArrayModule.convert_to_hash_with_indices(a) 

    result.keys[0].must_equal 1
    result.keys[1].must_equal 2
  end
end
