require 'rubygems'
require 'bundler/setup'

# Additional gems
require 'colorize'
require_relative 'main'

main = Main.new

main.clear_screen
main.start

# TODO: program execution should be placed here

main.end
