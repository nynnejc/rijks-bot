require 'httparty'
require 'dotenv'
require 'pry'
require 'rijksmus-api'
Dotenv.load

api_key = ENV["rijksmuseum_api_key"]

search_term = ARGV[0]

search_term || raise('No search term provided')

random_flower = Rijksmus::API::Client.new(search_term, api_key).random_image_search


puts random_flower


# user_input = Rijks.image_search ARGV[0]
#
# flower = Rijks.image_search "flower"
# search_count = textile["count"]
# number_of_search_pages = (search_count / 10).round
# random_search_page = rand(1..number_of_search_pages)
# random_object_index = rand(0..9)

# imageurl = textile["artObjects"][0]["webImage"]["url"]
