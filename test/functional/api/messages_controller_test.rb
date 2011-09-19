require 'test_helper'

class Api::MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should show message" do
    get :show, format: :json, id: @message.to_param
    assert_response :success
  end
end