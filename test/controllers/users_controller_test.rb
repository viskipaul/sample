  require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end
  
  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
end
