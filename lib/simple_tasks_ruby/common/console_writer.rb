# Wrapper for console messages
module SimpleTasksRuby
  class ConsoleWriter
    @@standard_output = Proc.new{|x| puts(x)} # Uses object's to_s method
    @@debug_output = Proc.new{|x| p(x)} # Prints each array's element - even non-visible characters

    def write_error(message)
      unless message.is_a? Enumerable
        write(message, color: :red) 
      else
        write_array(message, color: :red)
      end
    end 

    def write_success(message) 
      write(message, color: :green)
    end

    def write_message(message)
      write(message)
    end

    private
      def write(message, color = nil, output_mode = nil)
        output_mode ||= @@standard_output

        !color ? output_mode.call(message) : output_mode.call(message.colorize(color))
      end

      def write_array(array, color: nil, debug: false)
        selected_output_mode = debug ? @@debug_output : @@standard_output

        array.each do |elem|
          write(elem, color, selected_output_mode)
        end
      end
  end
end
