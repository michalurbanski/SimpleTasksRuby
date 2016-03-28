require 'rubygems'
require 'bundler/setup'

# Additional gems
require 'colorize'
require_relative 'main'
require_relative 'FileHandling/fileReader'
require_relative 'Converters/week_converter'
require_relative 'Models/day'
require_relative 'Models/week'

main = Main.new

main.clear_screen
main.start

main.read_from_file
main.convert_fileLines_to_objects

main.end
