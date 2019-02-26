require 'test_helper'

class ManageUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get manage_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get manage_users_show_url
    assert_response :success
  end

  test "should get index" do
    get manage_users_index_url
    assert_response :success
  end

end
