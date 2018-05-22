require 'simplecov'
SimpleCov.start
ENV["RAILS_ENV"] = "test"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
require "minitest/autorun"
require 'support/vcr'

require 'dotenv'

Dotenv.load
