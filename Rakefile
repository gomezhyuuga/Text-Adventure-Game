task default: %w[server]

task :server do
  sh 'ruby -I . -w src/server.rb'
end
task :doc do
  sh 'rdoc --exclude "public/|views/" src'
end