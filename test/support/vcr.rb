require 'webmock/minitest'
require 'minitest-vcr'
require 'vcr'

MinitestVcr::Spec.configure!

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock

  # For recording new connections for new test_cases, temporarily include these options:
  # config.default_cassette_options = {:record => :once}
  # config.allow_http_connections_when_no_cassette = true
  #
  # For permanent runs we prefer these stricter options. cbuggle 03.05.2018
  config.default_cassette_options = { allow_unused_http_interactions: false, record: :once }
  config.allow_http_connections_when_no_cassette = false

  config.filter_sensitive_data('<RIJKSMUSEUM_API_KEY>') { ENV['RIJKSMUSEUM_API_KEY'] }

  # We do not capture Twitter requests at this time. But once we introduce them we want to uncomment these. cbuggle, 03.05.2018
  # config.filter_sensitive_data('<CONSUMER_KEY>') { ENV["RIJKSBOT_CONSUMER_KEY"] }
  # config.filter_sensitive_data('<CONSUMER_SECRET>') { ENV["RIJKSBOT_CONSUMER_SECRET"] }
  # config.filter_sensitive_data('<ACCESS_TOKEN>') { ENV["RIJKSBOT_ACCESS_TOKEN"] }
  # config.filter_sensitive_data('<ACCESS_SECRET>') { ENV["RIJKSBOT_ACCESS_TOKEN"] }
end
