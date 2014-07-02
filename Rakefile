require 'rake/clean'
require 'rake/extensiontask'
# Gem Spec
gem_spec = Gem::Specification.load('cracklib.gemspec')

# Ruby Extension
Rake::ExtensionTask.new('cracklib', gem_spec)

# Packaging
require 'bundler/gem_tasks'
