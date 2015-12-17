require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = TwitterService.new
  end

  test "#users" do
    skip
    VCR.use_cassette("twitter_service#users") do


    end
  end

  test "#tweets" do
    skip
  end
end
