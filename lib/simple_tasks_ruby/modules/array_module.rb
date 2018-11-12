module SimpleTasksRuby
  module ArrayModule
    extend self

    def convert_to_hash_with_indices(array) 
      # zip method merges elements of self with corresponding elements from argument (which in this case is input array)
      # Example:
      # [test, test2] will produce {1 => test, 2 => test2}

      Hash[(1...array.size+1).zip array]
    end

    def is_nil_or_empty?(array)
      array.to_a.empty?
    end
  end
end
