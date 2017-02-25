module Rijksmus 
  module API
    class Client
      include ::HTTParty

      base_uri "https://www.rijksmuseum.nl/api/en"
      # debug_output
      default_params :format => "json"

      attr_accessor :search_term, :api_token

      def initialize(search_term, api_token)
        self.search_term = search_term
        self.api_token = api_token
        search_term || raise('No search term provided')
      end


      def images page = nil
        endpoint = '/collection'
        options = { query: { q: search_term, imgonly: true, p: page, ps: 10, culture: 'en', key: api_token } }
        response = self.class.get(endpoint, options)
        response
      end

      def random_image_search
        response = images 
        if response.success?
          count = response["count"]
          random_response = images rand((count / 10).round)
          random_response
        else
          puts response.inspect
          raise(response)
        end
      end
    end
  end
end