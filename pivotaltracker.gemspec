# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pivotaltracker/version'

Gem::Specification.new do |spec|
  spec.name          = "pivotaltracker"
  spec.version       = PivotalTracker::VERSION
  spec.authors       = ["Alvaro F. Lara"]
  spec.email         = ["alvaro.lara@alliants.com"]
  spec.summary       = %q{Pivotal Tracker API v.5 client.}
  spec.description   = %q{Pivotal Tracker API v.5 client.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
