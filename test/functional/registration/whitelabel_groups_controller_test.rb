require 'test_helper'

class Registration::WhitelabelGroupsControllerTest < ActionController::TestCase
  setup do
    @registration_whitelabel_group = registration_whitelabel_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_whitelabel_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_whitelabel_group" do
    assert_difference('Registration::WhitelabelGroup.count') do
      post :create, registration_whitelabel_group: { community_id: @registration_whitelabel_group.community_id, whitelabel_id: @registration_whitelabel_group.whitelabel_id }
    end

    assert_redirected_to registration_whitelabel_group_path(assigns(:registration_whitelabel_group))
  end

  test "should show registration_whitelabel_group" do
    get :show, id: @registration_whitelabel_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_whitelabel_group
    assert_response :success
  end

  test "should update registration_whitelabel_group" do
    put :update, id: @registration_whitelabel_group, registration_whitelabel_group: { community_id: @registration_whitelabel_group.community_id, whitelabel_id: @registration_whitelabel_group.whitelabel_id }
    assert_redirected_to registration_whitelabel_group_path(assigns(:registration_whitelabel_group))
  end

  test "should destroy registration_whitelabel_group" do
    assert_difference('Registration::WhitelabelGroup.count', -1) do
      delete :destroy, id: @registration_whitelabel_group
    end

    assert_redirected_to registration_whitelabel_groups_path
  end
end
