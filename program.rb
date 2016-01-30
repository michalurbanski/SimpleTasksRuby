require 'rubygems'
require 'bundler/setup'

# Additional gems
require 'colorize'
require_relative 'main'
require_relative 'FileHandling/fileReader'

main = Main.new

main.clear_screen
main.start

main.read_from_file
# TODO: process lines - change array of lines to class
main.convert_fileLines_to_objects

main.end
