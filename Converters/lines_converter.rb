class LinesConverter
  def initialize(lines)
    @lines = lines
  end

  def remove_blank_lines
    # this does not work
    #@lines -= %w{\n} # %w syntax changes \n into \\n

    @lines -= ["\n"] # deletes element from source array and assigns it to the same variable
  end
end
