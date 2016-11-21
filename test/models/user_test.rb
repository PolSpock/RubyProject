require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "full_name" do
    user = user(:seller)

    #assert_equal "#{user.first_name} #{user.last_name}", user
  end
end
