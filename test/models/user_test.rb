require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many :tweets

  test "creates user from oauth" do
    user = User.from_omniauth(users(:jason))

    assert user.valid?
    assert "jaspil_dev", user.screen_name
    assert "Jason Michael Pilz", user.name
  end
end
