module EmptyLinesRemovalModule 
  extend self

  # Works only for arrays
  def remove_blank_lines(lines) 
    raise ArgumentError.new("Array must be provided") unless lines.kind_of?(Array) 

    lines -= ["\n", "", ''] # deletes element from source array and assigns it to the same variable
  end
end
