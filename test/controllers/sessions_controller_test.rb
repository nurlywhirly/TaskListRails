require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    post :create,  {provider: "github"}
  end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
    end
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
    end
  end

  # I feel I am a bit off with this one
  # test "A non-logged-in user is redirected to login_path" do
  #   login_a_user
  #   redirect_to_url("/tasks")
  #   assert_template :login
  # end

  test "logging out nils the current user" do
    login_a_user
    get :logout
    assert_nil assigns[:current_user]
  end
end
