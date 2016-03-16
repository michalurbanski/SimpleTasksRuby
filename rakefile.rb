require 'rake/testtask'

# By default name of the task is 'test' so tests should be invoked using 'rake test'
Rake::TestTask.new do |t|
  t.libs << "test"
  #t.test_files = FileList['Tests/**/*test*.rb']
  t.pattern = 'Tests/**/*.rb' # runs test from folder and subfolders in Tests folder
  t.verbose = true
end
