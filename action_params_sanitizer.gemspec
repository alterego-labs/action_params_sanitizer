# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_params_sanitizer/version'

Gem::Specification.new do |spec|
  spec.name          = "action_params_sanitizer"
  spec.version       = ActionParamsSanitizer::VERSION
  spec.authors       = ["Sergey Gernyak"]
  spec.email         = ["sergeg1990@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport",  ">= 4.0.4"
  spec.add_dependency "actionpack",     ">= 4.0.4"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",         "3.2.0"
  spec.add_development_dependency "rspec-its",     "1.2.0"
  spec.add_development_dependency "pry-nav",       "0.2.3"
end
