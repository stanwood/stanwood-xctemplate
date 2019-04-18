
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stanwood/version"
require 'date'

Gem::Specification.new do |s|
  s.name          = "stanwood"
  s.version       = Stanwood::VERSION
  s.authors       = ["Tal Zion"]
  s.email         = ["talezion@gmail.com"]
  s.license       = "MIT"
  s.summary       = "The STANWOOD Architecture Templates"
  s.description   = "STANWOOD manages stanwood related tempalte to support our architecture"
  s.homepage      = "https://github.com/gems/stanwood-xctemplate"

  s.files         = `git ls-files`.split($/)
  s.executables   = ['stanwood', 'oak']
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'colored2',       '~> 3.1'
  s.add_runtime_dependency 'colorize',       '~> 0.8.1'

  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
