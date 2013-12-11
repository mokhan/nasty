require "bundler/gem_tasks"

task :default => :spec

task :spec do
  system 'rspec'
end

task :clean do
  system 'rm *.gem'
  system 'rm -fr pkg'
end

task :build => :clean do
  system 'gem build *.gemspec'
end

task :publish => :build do
  system 'gem push *.gem'
end
