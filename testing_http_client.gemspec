# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testing_http_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'testing_http_client'
  spec.version       = TestingHttpClient::VERSION
  spec.authors       = ['Nicolas Papagna Maldonado']
  spec.email         = ['nicolas.papagna@10pines.com']
  spec.description   = %q{An http client to be used for testing, to avoid mocking Net::HTTP stuff}
  spec.summary       = %q{An http client to be used for testing, to avoid mocking Net::HTTP stuff}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
