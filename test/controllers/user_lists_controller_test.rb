require 'test_helper'

class UserListsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_list" do
    get user_lists_follow_list_url
    assert_response :success
  end

  test "should get followed_list" do
    get user_lists_followed_list_url
    assert_response :success
  end

end
