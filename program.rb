require 'rubygems'
require 'bundler/setup'

require 'lib/simple_tasks_ruby/main'
require 'lib/simple_tasks_ruby/Common/console_writer'
require 'lib/simple_tasks_ruby/Modules/console_module'

main = Main.new(ConsoleWriter.new)

ConsoleModule.clear_screen

main.execute


