require 'rubygems'
require 'bundler/setup'
require 'date'
require 'logger'
require 'colorize'

require 'simple_tasks_ruby/main'

%w[console_writer].each do |common|
  require "simple_tasks_ruby/common/#{common}"
end

%w[weeks_parser days_parser].each do |parser|
  require "simple_tasks_ruby/parsers/#{parser}"
end

%w[week_converter lines_to_weeks_converter].each do |converter|
  require "simple_tasks_ruby/converters/#{converter}"
end

%w[task_creator].each do |creator|
  require "simple_tasks_ruby/creators/#{creator}"
end

%w[no_date_exception incorrect_date_for_day_exception].each do |exception|
  require "simple_tasks_ruby/exceptions/#{exception}"
end

%w[daily_status_extractor status_extractor].each do |extractor|
  require "simple_tasks_ruby/extractors/#{extractor}"
end

%w[logging].each do |logging|
  require "simple_tasks_ruby/logging/#{logging}"
end

%w[file_reader].each do |file_handling|
  require "simple_tasks_ruby/file_handling/#{file_handling}"
end

%w[weeks_manager tasks_manager].each do |manager|
  require "simple_tasks_ruby/managers/#{manager}"
end

%w[task aborted_task day delayed_task done_task possible_days possible_days_tester status_model task week].each do |model|
  require "simple_tasks_ruby/models/#{model}"
end

%w[console_module task_status date_consts empty_lines_removal_module].each do |mod|
  require "simple_tasks_ruby/modules/#{mod}"
end

%w[file_service].each do |service|
  require "simple_tasks_ruby/services/#{service}"
end

%w[tasks_printer].each do |helper|
  require "simple_tasks_ruby/helpers/#{helper}"
end

%w[data_reader file_system_data_reader production_data test_data].each do |data|
  require "data/#{data}"
end
