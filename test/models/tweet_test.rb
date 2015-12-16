require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  valid_params = { body: "my first tweet",
                   user_id: "4" }

  should belong_to(:user)

  test "it is valid with correct params" do
    tweet = Tweet.new(valid_params)
    assert tweet.valid?
  end

  test "it is invalid without a user id" do
    tweet = Tweet.new( body: "my first tweet" )
    refute tweet.valid?
  end

  test "it is invalid without a body" do
    tweet = Tweet.new( user_id: 5 )
    refute tweet.valid?
  end
end
