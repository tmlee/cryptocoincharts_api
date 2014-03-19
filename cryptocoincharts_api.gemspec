# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptocoincharts_api/version'

Gem::Specification.new do |spec|
  spec.name          = "cryptocoincharts_api"
  spec.version       = CryptocoinchartsApi::VERSION
  spec.authors       = ["TM Lee"]
  spec.email         = ["tm89lee@gmail.com"]
  spec.summary       = %q{Cryptocoincharts API Ruby wrapper for http://www.cryptocoincharts.info/v2/tools/api}
  spec.description   = %q{Cryptocoincharts API Ruby wrapper for http://www.cryptocoincharts.info/v2/tools/api}
  spec.homepage      = "http://www.cryptocoincharts.info/v2/tools/api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('faraday')
  spec.add_dependency('json')
  spec.add_development_dependency('fakeweb')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('debugger')

end
