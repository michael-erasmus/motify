# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motify/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "motify"
  s.version     = Motify::VERSION
  s.authors     = ["Michael Erasmus"]
  s.email       = ["hi@michaelerasm.us"]
  s.homepage    = "https://github.com/michael-erasmus/motify"
  s.summary     = "A minimal DSL for doing notifications in RubyMotion (using NSNotificationCenter)"
  s.description = "A minimal DSL for doing notifications in RubyMotion (using NSNotificationCenter)"
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
end
