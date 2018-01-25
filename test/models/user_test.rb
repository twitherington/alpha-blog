require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'can save User object' do
    user = User.new
    user.username = 'test'
    user.email = 'test@alphablog.com'
    user.password = 'password'
    assert user.save
  end

  test 'cannot save User without password' do
    user = User.new
    user.username = 'test2'
    user.email = 'test2@alphablog.com'
    assert_not user.save
  end

  test 'cannot save User without email' do
    user = User.new
    user.username = 'test2'
    user.password = 'password'
    assert_not user.save
  end

  test 'cannot save User without username' do
    user = User.new
    user.email = 'test2@alphablog.com'
    user.password = 'password'
    assert_not user.save
  end
end
