# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PipedrivePUT/version'

Gem::Specification.new do |spec|
  spec.name          = "PipedrivePUT"
  spec.version       = PipedrivePUT::VERSION
  spec.authors       = ["Jacob Shay"]
  spec.email         = ["jake_ps@comcast.net"]
  spec.summary       = 'Pipedrive gem that i needed'
  spec.description   = 'Pipedrive gem that i needed'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.2"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "em-resolv-replace"
  spec.add_development_dependency "eventmachine"
end
