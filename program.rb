require 'rubygems'
require 'bundler/setup'

require 'lib/simple_tasks_ruby/main'

%w[console_writer].each do |common|
  require "lib/simple_tasks_ruby/common/#{common}"
end

%w[lines_converter week_converter].each do |converter|
  require "lib/simple_tasks_ruby/converters/#{converter}"
end

%w[task_creator].each do |creator|
  require "lib/simple_tasks_ruby/creators/#{creator}"
end

%w[no_date_exception].each do |exception|
  require "lib/simple_tasks_ruby/exceptions/#{exception}"
end

%w[daily_status_extractor status_extractor].each do |extractor|
  require "lib/simple_tasks_ruby/extractors/#{extractor}"
end

%w[file_reader].each do |file_handling|
  require "lib/simple_tasks_ruby/file_handling/#{file_handling}"
end

%w[logging].each do |logging|
  require "lib/simple_tasks_ruby/logging/#{logging}"
end

%w[tasks_manager].each do |manager|
  require "lib/simple_tasks_ruby/managers/#{manager}"
end

%w[aborted_task day delayed_task done_task possible_days possible_days_tester status_model task week].each do |model|
  require "lib/simple_tasks_ruby/models/#{model}"
end

%w[console_module task_status].each do |mod|
  require "lib/simple_tasks_ruby/modules/#{mod}"
end

main = Main.new(ConsoleWriter.new)

ConsoleModule.clear_screen

main.execute


