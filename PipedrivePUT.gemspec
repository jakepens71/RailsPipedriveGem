# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PipedrivePUT/version'

Gem::Specification.new do |spec|
  spec.name          = "PipedrivePUT"
  spec.version       = PipedrivePUT::VERSION
  spec.authors       = ["JakePens71"]
  spec.email         = ["jake_ps@comcast.net"]
  spec.summary       = 'Pipedrive gem to retrieve data from Pipedrive.com'
  spec.description   = 'Pipedrive gem supports a small amount of functionality at the moment. Will add more when I can.'
  spec.homepage      = "https://github.com/jakepens71/RailsPipedriveGem"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "Gemfile", "Rakefile", "spec/*", "lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.2"
  spec.add_development_dependency "rest-client", ">= 1.8.0"
  spec.add_development_dependency "em-resolv-replace", ">= 1.1.3"
  spec.add_development_dependency "eventmachine", ">= 1.0.7"
end
