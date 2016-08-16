# Wrapper for console messages
class ConsoleWriter
  def write_message(message, color = nil)
    !color ? puts(message) : puts(message.colorize(color))
  end
end
