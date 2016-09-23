# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graph-reader/version'

Gem::Specification.new do |spec|
  spec.name          = "graph-reader"
  spec.version       = Graph::Reader::VERSION
  spec.authors       = ["shadow3x3x3"]
  spec.email         = ["shadow3x3x3@gmail.com"]

  spec.summary       = %q{Read Nodes and Edges data to Graph}
  spec.description   = %q{This gem can make Nodes and Edges data that are in txt transforming ruby objects.}
  spec.homepage      = "https://github.com/shadow3x3x3/graph-reader"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } + Dir['lib/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
