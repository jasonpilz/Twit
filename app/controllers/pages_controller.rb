class PagesController < ApplicationController
  def home
    client = TwitterService.new(current_user)
    @tweets = client.tweets
    @user = client.user

    # @tweets = current_user.twitter.home_timeline
    # @user = current_user.twitter
  end
end
