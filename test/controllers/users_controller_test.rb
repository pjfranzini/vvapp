require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # test "should get user" do
  #   get :show, id: users(:paula).id

  #   assert assigns(:user)
  #   assert :success
  # end
  def setup
    session[:user_id] = users(:paula).id
  end

  test "should show profile for current user" do
    get :profile

    assert assigns(:current_user), 'current user object not assigned to view'
    assert :success
  end
end
