module Rijksmus
  module API
    class Client
      include ::HTTParty

      base_uri 'https://www.rijksmuseum.nl/api/en'
      # debug_output
      default_params format: 'json'

      attr_accessor :search_term, :api_token

      def initialize(search_term, api_token)
        self.search_term = search_term
        self.api_token = api_token
        search_term || raise('No search term provided')
      end

      def images_response
        page = nil
        endpoint = '/collection'
        options = { query: { q: search_term, imgonly: true, p: page, ps: 100, culture: 'en', key: api_token } }
        self.class.get(endpoint, options)
      end

      def random_image_search
        images_response
        return images_response['artObjects'].sample if images_response.success?
        raise(images_response.inspect)
      end
    end
  end
end
