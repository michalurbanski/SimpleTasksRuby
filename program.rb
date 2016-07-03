require 'rubygems'
require 'bundler/setup'

# Additional gems
require 'colorize'
require_relative 'main'
require_relative 'FileHandling/file_reader'
require_relative 'Converters/week_converter'
require_relative 'Models/day'
require_relative 'Models/week'

main = Main.new

main.clear_screen
main.start

main.read_from_file
main.convert_fileLines_to_objects
main.create_tasks_from_week_days
all_delayed_tasks = main.find_delayed_tasks

main.end
