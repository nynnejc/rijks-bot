require 'test_helper'
require 'rijksbot'

describe Rijksbot, :vcr do

  let(:twitter_client){ Minitest::Mock.new } # I mocked the TwitterClient as I do not know and do not want to expose the bot's twitter credentials and I cannot signup for a new Twitter APP at this time. We might want to try to catch the Twitter requests on VCR as well. cbuggle. 03.05.2018

  let(:search_term){"Mermaid"}

  let(:tweet_1){ Twitter::Tweet.new(id: "tweet-1", text: search_term) }
  let(:tweet_no_hit){ Twitter::Tweet.new(id: "tweet-2", text: "nowayasearchresult") }


  subject{ Rijksbot.new(twitter_client) }


  it "delivers an image" do
    twitter_client.expect :user_timeline, [tweet_1]
    subject.get_image( search_term )["links"]["self"].must_match "https://www.rijksmuseum.nl/api/en/" # commmon path of all randomly selected 4 images. cbuggle, 03.05.2018
  end

  it "defaults to no-result message" do
    twitter_client.expect :user_timeline, [tweet_no_hit]
    assert_nil subject.get_image( "search_term" )
  end

  it "posts to twitter", vcr: {match_requests_on: [:host], allow_unused_http_interactions: false } do
    # Tempfile contains a google URL with random filename. restrict matching to :host solves this.
    # Also the domain alternates between "lh3.googleusercontent.com" and "lh4.googleusercontent.com" …, so we captured all of them and allow some unused.
    # Not very elegant but good enough for the time being. cbuggle, 03.05.2018
    twitter_client.expect :user_timeline, [tweet_1]
    twitter_client.expect(:update_with_media, true, [String, Tempfile, {:in_reply_to_status_id=>"tweet-1"}])

    image = subject.get_image( search_term )
    subject.reply_with_image(tweet_1, image )
  end

end
