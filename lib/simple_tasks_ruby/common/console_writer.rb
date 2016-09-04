# Wrapper for console messages
class ConsoleWriter
  @@standard_output = Proc.new{|x| puts(x)} # Uses object's to_s method
  @@debug_output = Proc.new{|x| p(x)} # Prints each array's element - even non-visible characters

  def write_message(message, color = nil, output_mode = nil)
    output_mode ||= @@standard_output

    !color ? output_mode.call(message) : output_mode.call(message.colorize(color))
  end

  def write_array(array, color: nil, debug: false)
    selected_output_mode = debug ? @@debug_output : @@standard_output

    array.each do |elem|
      write_message(elem, color, selected_output_mode)
    end
  end
end
