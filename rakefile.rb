require 'rake/testtask'

# By default name of the task is 'test' so tests should be invoked using 'rake test'
Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"] # list of directories to be added to $LOAD_PATH before running tests
  #t.test_files = FileList['Tests/**/*test*.rb'] # this does not seeem to work
  t.test_files = FileList['spec/simple_tasks_ruby/other/task_spec.rb', 'spec/simple_tasks_ruby/other/done_task_spec.rb']
  #t.pattern = 'spec/**/task_spec.rb' # runs test from folder and subfolders in spec folder
  t.verbose = false
end
