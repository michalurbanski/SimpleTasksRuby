require 'rubygems'
require 'bundler/setup'

# Additional gems
require 'colorize'
require_relative 'main'
require_relative 'FileHandling/fileReader'

main = Main.new

main.clear_screen
main.start

# TODO: program execution should be placed here
filePath = "Samples/first.txt"
fileReader = FileReader.new(filePath)
lines = fileReader.read_file

# TODO: print lines
puts("Printing file content".colorize(:green))
puts(lines)

main.end
