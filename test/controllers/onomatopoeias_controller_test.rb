require 'test_helper'

class OnomatopoeiasControllerTest < ActionController::TestCase
  setup do
    @onomatopoeia = onomatopoeias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onomatopoeias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onomatopoeia" do
    assert_difference('Onomatopoeia.count') do
      post :create, onomatopoeia: { name: @onomatopoeia.name }
    end

    assert_redirected_to onomatopoeia_path(assigns(:onomatopoeia))
  end

  test "should show onomatopoeia" do
    get :show, id: @onomatopoeia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onomatopoeia
    assert_response :success
  end

  test "should update onomatopoeia" do
    patch :update, id: @onomatopoeia, onomatopoeia: { name: @onomatopoeia.name }
    assert_redirected_to onomatopoeia_path(assigns(:onomatopoeia))
  end

  test "should destroy onomatopoeia" do
    assert_difference('Onomatopoeia.count', -1) do
      delete :destroy, id: @onomatopoeia
    end

    assert_redirected_to onomatopoeias_path
  end
end
