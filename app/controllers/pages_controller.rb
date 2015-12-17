class PagesController < ApplicationController
  def home
    client = TwitterService.new(current_user)
    @tweets = client.tweets
    @user = client.user
  end

  def create
    binding.pry
    build_service.post_tweet(params[:tweet][:body])
    redirect_to :back
  end

  private
    def build_service
      @service ||= TwitterService.new(current_user)
    end
end
