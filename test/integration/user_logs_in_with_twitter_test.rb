require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    VCR.use_cassette('user_logs_in') do
      visit "/"
      assert_equal 200, page.status_code
      click_button "Twitter"
      assert_equal "/jaspil_dev", current_path
      assert page.has_content?("Jason")
      assert page.has_content?("Logout")
    end
  end
end
