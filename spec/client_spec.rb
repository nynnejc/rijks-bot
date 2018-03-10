require "minitest/autorun"
require_relative '../lib/rijksmus-api'

describe Rijksmus::API::Client do
  before do
    @client = Rijksmus::API::Client.new(search_term, 'XxQeSXj5')
  end

  describe "successful APi call" do
    it "must respond with 200" do
      expect(@client.images.code).to eq(200)
    end
  end
end
