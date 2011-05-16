begin
  require 'rocco/tasks'
  desc "Build Rocco Docs"
  Rocco::make 'doc/', ['lib/**/*.rb']
rescue LoadError
  warn "#$! -- rocco tasks not loaded."
  task :rocco
end
