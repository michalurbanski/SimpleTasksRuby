require 'rubygems'
require 'bundler/setup'
require 'date'
require 'logger'
require 'colorize'

%w[console_writer].each do |common|
  require "simple_tasks_ruby/common/#{common}"
end

%w[logging logger_factory].each do |logging|
  require "simple_tasks_ruby/logging/#{logging}"
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

%w[weeks_manager tasks_manager tasks_summary_engine].each do |manager|
  require "simple_tasks_ruby/managers/#{manager}"
end

%w[console_module task_status date_consts empty_lines_removal_module array_module task_type].each do |mod|
  require "simple_tasks_ruby/modules/#{mod}"
end

%w[task day possible_days possible_days_tester status_model task week configuration file_line].each do |model|
  require "simple_tasks_ruby/models/#{model}"
end

%w[file_service configuration_service].each do |service|
  require "simple_tasks_ruby/services/#{service}"
end

%w[tasks_printer].each do |helper|
  require "simple_tasks_ruby/helpers/#{helper}"
end

%w[file_system_data_reader production_data test_data].each do |data|
  require "simple_tasks_ruby/readers/#{data}"
end

%w[logger_decorator].each do |decorator|
  require "simple_tasks_ruby/decorators/#{decorator}"
end
