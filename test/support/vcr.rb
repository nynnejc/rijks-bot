require 'webmock/minitest'
require "minitest-vcr"
require 'vcr'

MinitestVcr::Spec.configure!

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock

  # For recording new connections for new test_cases, temporarily include these options:
  # config.default_cassette_options = {:record => :once}
  # config.allow_http_connections_when_no_cassette = true.
  #
  # For permanent runs we prefer these stricter options. cbuggle 03.05.2018
  config.default_cassette_options = { allow_unused_http_interactions: false, :record => :none }
  config.allow_http_connections_when_no_cassette = false
end
