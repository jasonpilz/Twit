class PagesController < ApplicationController
  def home
    @tweets ||= current_user.twitter.home_timeline
    @user ||= current_user.twitter
  end
end
