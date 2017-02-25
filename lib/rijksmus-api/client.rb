module Rijksmus 
  module API
    class Client
      include HTTParty

      base_uri "https://www.rijksmuseum.nl/api/en/collection"
      default_params :key => ENV["rijksmuseum_api_key"], :format => "json"

      attr_accessor :query, :p

      def initialize(query)
        self.query = query
        self.p = p
      end


      def self.random_image_search query
        response = get("?q=#{ query }&imgonly=true&ps=10&culture=en")
        if response.success?
          count = response["count"]
          number_of_search_pages = (count / 10).round
          random_response = get("?q=#{ query }&p=#{rand(1..number_of_search_pages)}imgonly=true&ps=10")
          random_response
        else
          raise response.response
        end
      end
    end
  end
end