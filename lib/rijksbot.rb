require 'httparty'
require 'rijksmus-api'
require 'twitter'
require 'open-uri'

class Rijksbot
  def initialize(twitter_api)
    @twitter_api = twitter_api
  end

  def already_replied?(tweet)
    already_replied_to =  @twitter_api.user_timeline(count: 800).map{|t| t.in_reply_to_status_id}
    already_replied_to.include?(tweet.id)
  end

  # create def count_twitter_max = 800
  # create def one_day_in_seconds = 86400

  def extract_search(tweet)
    tweet.text.downcase.sub("@rijks_bot", "").strip
  end

  def random_image
    random_words = %w(lemon pineapple banana cheese orange butterfly stilleven vanitas painting ballet unicorn heart naakt dieren)
    random_word = random_words.sample
    get_image(random_word).merge({
      "title" => "Couldn't find an image for that."
    })
  end

  def get_image(search_term)
    api_key = ENV["RIJKSMUSEUM_API_KEY"]
    image = Rijksmus::API::Client.new(search_term, api_key).random_image_search
  end

  def reply_with_image(tweet, image)
    image_url = image["webImage"]["url"]
    image_title = image["title"]
    screen_name =  "@" + tweet.user.screen_name
    text = screen_name + " " + image_title
    @twitter_api.update_with_media(text, open(image_url), in_reply_to_status_id: tweet.id)
  end
end
