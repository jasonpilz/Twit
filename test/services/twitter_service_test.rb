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

  test "#tweets" do
    VCR.use_cassette("twitter_service#tweets") do
      tweets = client.tweets

      assert_equal 20, tweets.count
    end
  end
end
