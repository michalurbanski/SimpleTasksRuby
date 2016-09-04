require 'rake/testtask'

# By default name of the task is 'test' so tests should be invoked using 'rake test'
Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  #t.test_files = FileList['Tests/**/*test*.rb']
  t.pattern = 'spec/**/*.rb' # runs test from folder and subfolders in spec folder
  t.verbose = true
end
