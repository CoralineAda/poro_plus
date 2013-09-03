# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'poro_plus/version'

Gem::Specification.new do |spec|
  spec.name          = "poro_plus"
  spec.version       = PoroPlus::VERSION
  spec.authors       = ["Bantik"]
  spec.email         = ["corey@idolhands.com"]
  spec.description   = %q{Simple methods to make POROs more fun.}
  spec.summary       = %q{Simple methods to make Plain Old Ruby Objects (POROs) more fun.}
  spec.homepage      = "https://github.com/Bantik/poro_plus"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
