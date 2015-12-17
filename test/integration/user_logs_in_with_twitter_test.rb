require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    VCR.use_cassette('oauth_login') do
      visit "/"
      assert_equal 200, page.status_code
      click_link "Twitter"
      assert_equal "/jaspil_dev", current_path
      assert page.has_content?("Jason")
      assert page.has_content?("Logout")
    end
  end

  test "logging out" do
    VCR.use_cassette('oauth_logout') do
      login_user

      assert_equal 200, page.status_code
      assert page.has_content?("Jason Michael Pilz")

      click_link "Logout"
      assert_equal "/", current_path
      refute page.has_content?("Jason Michael Pilz")
      refute page.has_link?("Logout")
    end
  end
end
