require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get posts_after_date" do
    get :posts_after_date
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
