# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashing/semaphore/version'

Gem::Specification.new do |spec|
  spec.name          = "dashing-semaphore"
  spec.version       = Dashing::Semaphore::VERSION
  spec.authors       = ["Pierre-Louis Gottfrois"]
  spec.email         = ["pierrelouis.gottfrois@gmail.com"]
  spec.description   = %q{Dashing widget that display build status of project on Semaphore CI}
  spec.summary       = %q{Dashing widget that display build status of project on Semaphore CI}
  spec.homepage      = "https://github.com/gottfrois/dashing-semaphore"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
