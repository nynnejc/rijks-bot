require_relative '../../lib/rijksmus-api'
require 'test_helper'

describe Rijksmus::API::Client, :vcr do
  extend Minitest::Spec::DSL

  let(:search_term) { 'Karlsruhe' }

  subject { Rijksmus::API::Client.new(search_term, ENV['RIJKSMUSEUM_API_KEY']) }

  describe 'requesting art' do
    it 'is successful' do
      subject.images_response.code.must_equal 200
    end

    it 'delivers timestamp' do
      subject.images_response.headers['date'].must_equal 'Wed, 23 May 2018 09:31:42 GMT'
    end

    it 'delivers 4 artObjects' do
      subject.images_response.parsed_response['artObjects'].length.must_equal 4
    end
  end
end
