require 'test_helper'

class UserentriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userentry" do
    assert_difference('Userentry.count') do
      post :create, :userentry => { }
    end

    assert_redirected_to userentry_path(assigns(:userentry))
  end

  test "should show userentry" do
    get :show, :id => userentries(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => userentries(:one).id
    assert_response :success
  end

  test "should update userentry" do
    put :update, :id => userentries(:one).id, :userentry => { }
    assert_redirected_to userentry_path(assigns(:userentry))
  end

  test "should destroy userentry" do
    assert_difference('Userentry.count', -1) do
      delete :destroy, :id => userentries(:one).id
    end

    assert_redirected_to userentries_path
  end
end
