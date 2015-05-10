require 'test_helper'

class OnomatopesControllerTest < ActionController::TestCase
  setup do
    @onomatope = onomatopes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onomatopes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onomatope" do
    assert_difference('Onomatope.count') do
      post :create, onomatope: { name: @onomatope.name }
    end

    assert_redirected_to onomatope_path(assigns(:onomatope))
  end

  test "should show onomatope" do
    get :show, id: @onomatope
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onomatope
    assert_response :success
  end

  test "should update onomatope" do
    patch :update, id: @onomatope, onomatope: { name: @onomatope.name }
    assert_redirected_to onomatope_path(assigns(:onomatope))
  end

  test "should destroy onomatope" do
    assert_difference('Onomatope.count', -1) do
      delete :destroy, id: @onomatope
    end

    assert_redirected_to onomatopes_path
  end
end
