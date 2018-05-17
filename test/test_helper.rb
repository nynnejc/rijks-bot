ENV["RAILS_ENV"] = "test"

require "minitest/autorun"
require 'support/vcr'

require 'dotenv'

Dotenv.load
