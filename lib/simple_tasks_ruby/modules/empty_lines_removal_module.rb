module EmptyLinesRemovalModule 
  extend self

  # Works only for arrays
  def remove_blank_lines(lines) 
    raise ArgumentError.new("Array of strings must be provided") unless ArrayModule.array_of_strings?(lines) 

    lines -= ["\n", "", ''] # deletes element from source array and assigns it to the same variable
  end
end
