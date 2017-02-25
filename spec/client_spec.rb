require "minitest/autorun"
require_relative '../lib/rijksmus-api'

describe Rijksmus::API::Client do
  before do
    @client = Rijksmus::API::Client.new(search_term, 'XxQeSXj5')
  end

  let(:search_term) { 'cat' }
  let(:expected_response) {
    File.open('spec/response.json')
  }
  describe "successful APi call" do
    it "must respond with 200" do
      # puts expected_response.inspect
      @client.images.must_equal expected_response
    end
  end

  # describe "when asked about blending possibilities" do
  #   xit "won't say no" do
  #     @meme.will_it_blend?.wont_match /^no/i
  #   end
  # end
end