require 'httparty'
require 'dotenv'
require 'pry'
require 'rijksmus-api'
Dotenv.load

api_key = ENV["rijksmuseum_api_key"]



search_term = ARGV[0]
puts ARGV.inspect
random_number = rand(0..9)
random_textile = Rijksmus::API::Client.new(search_term, api_key).random_image_search
# puts random_textile.body.inspect
random_object_image_url = random_textile.body["artObjects"][random_number]["webImage"]["url"]
# puts random_object_image_url

random_textile_image_title = random_textile["artObjects"][random_number]["longTitle"]

# puts random_textile_image_title


# user_input = Rijks.image_search ARGV[0]
#
# textile = Rijks.image_search "textile"
# search_count = textile["count"]
# number_of_search_pages = (search_count / 10).round
# random_search_page = rand(1..number_of_search_pages)
# random_object_index = rand(0..9)

# imageurl = textile["artObjects"][0]["webImage"]["url"]
