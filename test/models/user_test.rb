require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "can create user" do
    j = User.new
    j.email = "julie@test.com"
    j.password = "password"
    j.save
    assert_equal j.email, "julie@test.com"
  end

end
