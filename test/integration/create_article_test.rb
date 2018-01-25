require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'John', email: 'john@example.com', password: 'password', admin: true)
  end

  test 'creating an article' do
    sign_in_as(@user, 'password')
    get new_article_path
    assert_template 'articles/new'
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: 'test', description: 'this is a test', user_id: @user.id}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end

end
