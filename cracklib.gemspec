# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cracklib/version"

Gem::Specification.new do |s|
  s.name        = "cracklib"
  s.version     = Cracklib::VERSION
  s.authors     = ["Florian Kasper"]
  s.email       = ["florian.kasper@corscience.de"]
  s.homepage    = "http://git.er.corscience.de"
  s.summary     = %q{Cracklib for Ruby}
  s.description = %q{implementation of cracklib in ruby}

  s.rubyforge_project = s.name
  s.license = "LGPLv2"

  s.files         = `git ls-files`.split("\n")
  s.extensions    = [ 'ext/cracklib/extconf.rb' ]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_development_dependency "rake-compiler", "~> 0.8.3"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rake", "~> 10.1"
end
