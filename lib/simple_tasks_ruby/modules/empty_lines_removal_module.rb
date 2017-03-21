module EmptyLinesRemovalModule 
  extend self

  def remove_blank_lines(lines) 
    lines -= ["\n"] # deletes element from source array and assigns it to the same variable
  end
end
