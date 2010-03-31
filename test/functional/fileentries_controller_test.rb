require 'test_helper'

class FileentriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fileentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fileentry" do
    assert_difference('Fileentry.count') do
      post :create, :fileentry => { }
    end

    assert_redirected_to fileentry_path(assigns(:fileentry))
  end

  test "should show fileentry" do
    get :show, :id => fileentries(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fileentries(:one).id
    assert_response :success
  end

  test "should update fileentry" do
    put :update, :id => fileentries(:one).id, :fileentry => { }
    assert_redirected_to fileentry_path(assigns(:fileentry))
  end

  test "should destroy fileentry" do
    assert_difference('Fileentry.count', -1) do
      delete :destroy, :id => fileentries(:one).id
    end

    assert_redirected_to fileentries_path
  end
end
