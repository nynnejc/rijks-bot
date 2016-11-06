require 'httparty'
require 'dotenv'
Dotenv.load

api_key = ENV["rijksmuseum_api_key"]

class Rijksmus
  include HTTParty

  base_uri "https://www.rijksmuseum.nl/api/en/collection"
  default_params :key => ENV["rijksmuseum_api_key"], :format => "json"

  attr_accessor :query, :p

  def initialize(query)
    self.query = query
    self.p = p
  end

  def self.random_image_search(query)
    response = get("?q=#{ query }&imgonly=true&ps=10")
    if response.success?
      response
    else
      raise response.response
    end
  end


  def self.random_image_search query
    response = get("?q=#{ query }&imgonly=true&ps=10")
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

random_textile = Rijksmus.random_image_search "textile"
random_object_image_url = random_textile["artObjects"][rand(0..9)]["webImage"]["url"]
puts random_object_image_url
# user_input = Rijks.image_search ARGV[0]
#
# textile = Rijks.image_search "textile"
# search_count = textile["count"]
# number_of_search_pages = (search_count / 10).round
# random_search_page = rand(1..number_of_search_pages)
# random_object_index = rand(0..9)

# imageurl = textile["artObjects"][0]["webImage"]["url"]
