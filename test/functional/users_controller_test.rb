require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should create a new user" do
    assert_difference("User.count", +1) do
      post :create, :user => {
        :email => "shaokun.wu@gmail.com",
        :password => "a"
      }
      
      assert_redirected_to root_path
    end
  end
end
