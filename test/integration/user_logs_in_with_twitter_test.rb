require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_button "Twitter"
    assert_equal "/home", current_path
    assert page.has_content?("Jason")
    assert page.has_link?("Logout")
  end
end
