require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test 'creating a user' do
    get signup_path
    assert_template 'users/new'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: 'test', email: 'test@test.com', password: 'password'}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end

end
