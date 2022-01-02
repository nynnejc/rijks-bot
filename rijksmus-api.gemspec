
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rijksmus-api/version'

Gem::Specification.new do |spec|
  spec.name          = 'rijksmus-api'
  spec.version       = Rijksmus::API::VERSION
  spec.authors       = ['Nynne, Sarah, Daniel und Tonio']
  spec.email         = ['mail@danielsenff.de']
  spec.summary       = 'Image Finder Gem for the Rijskmuseum API'
  spec.description   = 'Image Finder Gem for the Rijskmuseum API'
  spec.homepage      = 'https://github.com/nynnejc/rijks-bot'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv'
  spec.add_dependency 'httparty'
  spec.add_dependency 'twitter'

  spec.add_runtime_dependency 'rubocop', '~> 0.56.0'

  spec.add_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'

  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'minitest-reporters', '~> 1.2'

  spec.add_development_dependency 'minitest-vcr', '~> 1.4'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock', '~> 3.3'
end
