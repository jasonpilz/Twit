require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_button "Twitter"
    assert_equal "/jaspil_dev", current_path
    assert page.has_content?("Jason Michael Pilz")
    assert page.has_link?("Logout")
  end
end
