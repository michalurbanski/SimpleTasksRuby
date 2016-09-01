require 'rubygems'
require 'bundler/setup'

require_relative 'main'
require_relative 'Common/console_writer'
require_relative 'Modules/console_module'

# Method must be declared above its usage
def load_libraries_to_load_path
  #$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

  puts(File.join(File.dirname(__FILE__), '..', 'lib'))

  puts "Load path is"
  puts $LOAD_PATH
end

load_libraries_to_load_path
main = Main.new(ConsoleWriter.new)

ConsoleModule.clear_screen

main.execute


