require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should set the name through email" do
    user = User.new(:email => "shaokun.wu@gmail.com", :password => "a")
    assert user.save
    assert_equal "shaokun.wu", user.name
  end
end
