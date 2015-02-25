# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/cequel/version'

Gem::Specification.new do |spec|
  spec.name           = "carrierwave-cequel"
  spec.version        = Carrierwave::Cequel::VERSION
  spec.authors        = ["Claude Ciocan"]
  spec.email          = ["cciocan@gmail.com"]
  spec.summary        = %q{Cequel support for CarrierWave}
  spec.description    = %q{Cequel support for CarrierWave}
  spec.homepage       = "https://github.com/claude/carrierwave-cequel"
  spec.license        = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  s.add_dependency "carrierwave"
  s.add_dependency "cequel"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
