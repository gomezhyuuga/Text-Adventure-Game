task default: %w[server]

task :server do
  sh 'ruby -I . src/server.rb'
end
task :doc do
  sh 'rdoc --main src/README.txt --exclude "public/|views/|.csv" src'
end
task :sandbox do
  sh 'ruby src/models/sandbox.rb'
end
task :seed do
  sh 'ruby -I . src/db/seed.rb'
end
