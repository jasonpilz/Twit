require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :client

  def setup
    @client = TwitterService.new(users(:jason))
  end

  test "#user" do
    VCR.use_cassette("twitter_service#user") do
      user = client.user

      assert_equal "jaspil_dev", user.screen_name
      assert_equal "Jason Michael Pilz", user.name
    end
  end

  test "#post_tweet" do
    VCR.use_cassette("twitter_service#post_tweet") do
      tweet_text = "Tweet is up"
      posted_tweet = client.post_tweet(tweet_text)

      assert posted_tweet.created?
      last_tweet = client.tweets.first

      assert_equal tweet_text, last_tweet.text
    end
  end

  test "#tweets" do
    VCR.use_cassette("twitter_service#tweets") do
      tweets = client.tweets

      assert_equal 20, tweets.count
      assert_equal "Tweet is up", tweets.first.text
    end
  end

  test "#favorite_tweet" do
    VCR.use_cassette("twitter_service#favorite_tweet") do
      unfavorited_tweet = client.tweets.first

      refute unfavorited_tweet.favorited?

      favorited_tweet = client.favorite_tweet(unfavorited_tweet.id).first

      assert favorited_tweet.favorited?
      assert_equal unfavorited_tweet.id, favorited_tweet.id
    end
  end

end
