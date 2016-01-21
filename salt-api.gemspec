# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salt/api/version'

Gem::Specification.new do |spec|
  spec.name          = "salt-api"
  spec.version       = Salt::Api::VERSION
  spec.authors       = ["Joshua B. Bussdieker"]
  spec.email         = ["jbussdieker@gmail.com"]

  spec.summary       = %q{Simple gem for communicating with a salt server.}
  spec.homepage      = "https://github.com/jbussdieker/ruby-salt-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
