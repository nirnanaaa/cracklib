require 'rake/clean'
require 'rake/extensiontask'
# Gem Spec
gem_spec = Gem::Specification.load('cracklib.gemspec')

# Ruby Extension
Rake::ExtensionTask.new('cracklib', gem_spec) do |ext|
  ext.cross_compile = true if RUBY_PLATFORM !~ /mswin|mingw/
  ext.cross_platform = ['x86-mingw32', 'x64-mingw32']
end

# Packaging
require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['--color', '--format', 'documentation']
end
task :spec => 'compile'

task :default => [ :spec, "native", :gem]
