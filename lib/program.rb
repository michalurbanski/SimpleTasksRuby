require 'libraries' # all require statements are put here

ConsoleModule.clear_screen

Logging.options = {:type => :file, :name => "log.log"} # TODO: downside - creates logs in place from which program is executed

main = Main.new
main.execute
