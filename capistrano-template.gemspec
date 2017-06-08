# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/template/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-template"
  gem.version       = Capistrano::Template::VERSION
  gem.authors       = ["Tony Pitluga"]
  gem.email         = ["tony.pitluga@gmail.com"]
  gem.summary       = %q(Erb-Template rendering and upload for capistrano 3)
  gem.description   = %q(A capistrano 3 plugin that aids in rendering erb templates and
uploads the content to the server if the file does not exists at
the remote host or the content did change)
  gem.homepage      = "https://github.com/Navionics/capistrano-template"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "capistrano", "> 2.0.0"

  gem.add_development_dependency "rake"
end
