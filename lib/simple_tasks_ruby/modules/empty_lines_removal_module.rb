module SimpleTasksRuby
  module EmptyLinesRemovalModule
    extend self

    @@empty_lines_values = ["\n", "", '']

    # This method expects FileLine objects
    def remove_blank_lines!(file_lines)
      raise ArgumentError.new("Input must not be nil") if file_lines.nil?

      # delete_if method modifies original array
      file_lines.delete_if {|elem| contains_empty_line?(elem)}
    end

    private
      def contains_empty_line?(file_line)
        @@empty_lines_values.include?(file_line.data) ? true : false
      end
  end
end
