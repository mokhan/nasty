# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nasty/version'

Gem::Specification.new do |spec|
  spec.name          = "nasty"
  spec.version       = Nasty::VERSION
  spec.authors       = ["mo khan"]
  spec.email         = ["mo@mokhan.ca"]
  spec.description   = %q{something nasty to add to your ruby}
  spec.summary       = %q{basicly it's a commons library}
  spec.homepage      = "http://github.com/mokhan/nasty"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
