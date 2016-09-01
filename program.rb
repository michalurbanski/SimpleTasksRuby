require 'rubygems'
require 'bundler/setup'

require_relative 'main'
require_relative 'Common/console_writer'
require_relative 'Modules/console_module'

main = Main.new(ConsoleWriter.new)

ConsoleModule.clear_screen

main.execute


