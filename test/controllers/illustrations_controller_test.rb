require 'test_helper'

class IllustrationsControllerTest < ActionController::TestCase
  setup do
    @illustration = illustrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:illustrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create illustration" do
    assert_difference('Illustration.count') do
      post :create, illustration: { image: @illustration.image }
    end

    assert_redirected_to illustration_path(assigns(:illustration))
  end

  test "should show illustration" do
    get :show, id: @illustration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @illustration
    assert_response :success
  end

  test "should update illustration" do
    patch :update, id: @illustration, illustration: { image: @illustration.image }
    assert_redirected_to illustration_path(assigns(:illustration))
  end

  test "should destroy illustration" do
    assert_difference('Illustration.count', -1) do
      delete :destroy, id: @illustration
    end

    assert_redirected_to illustrations_path
  end
end
