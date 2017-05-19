module ArrayModule
  extend self

  def convert_to_hash_with_indices(array) 
    Hash[(1...array.size+1).zip array]
  end
end
