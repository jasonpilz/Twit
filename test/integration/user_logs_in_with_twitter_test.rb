require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_button "twitter-login"
    save_and_open_page
    assert_equal "/JasonPilz", current_path
    assert page.has_link?("Logout")
    assert page.has_content?("Jason")
  end
end
