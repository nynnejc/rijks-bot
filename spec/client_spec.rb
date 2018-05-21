require_relative '../lib/rijksmus-api'

RSpec.describe Rijksmus::API::Client do
  before do
    @client = Rijksmus::API::Client.new(search_term,  ENV["RIJKSMUSEUM_API_KEY"])
  end

  let(:search_term){"duck"}
  describe "successful APi call" do
    it "must respond with 200" do
      expect(@client.images.code).to eq(200)
    end
  end

end
