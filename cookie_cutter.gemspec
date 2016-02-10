# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cookie_cutter/version'

Gem::Specification.new do |spec|
  spec.name          = "cook.ie"
  spec.version       = CookieCutter::VERSION
  spec.authors       = ["Ritchie Macapinlac"]
  spec.email         = ["ritchie@macapinlac.com"]

  spec.summary       = %q{This Gem makes cookies if cookies were files derived from erb templates.}
  spec.homepage      = "TODO: Make a website / webpage for this Gem."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  #end

  spec.add_runtime_dependency "log4r"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
end
