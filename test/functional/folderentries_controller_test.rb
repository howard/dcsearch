require 'test_helper'

class FolderentriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folderentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folderentry" do
    assert_difference('Folderentry.count') do
      post :create, :folderentry => { }
    end

    assert_redirected_to folderentry_path(assigns(:folderentry))
  end

  test "should show folderentry" do
    get :show, :id => folderentries(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => folderentries(:one).id
    assert_response :success
  end

  test "should update folderentry" do
    put :update, :id => folderentries(:one).id, :folderentry => { }
    assert_redirected_to folderentry_path(assigns(:folderentry))
  end

  test "should destroy folderentry" do
    assert_difference('Folderentry.count', -1) do
      delete :destroy, :id => folderentries(:one).id
    end

    assert_redirected_to folderentries_path
  end
end
