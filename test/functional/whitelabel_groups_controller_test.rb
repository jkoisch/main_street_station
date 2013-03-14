require 'test_helper'

class WhitelabelGroupsControllerTest < ActionController::TestCase
  setup do
    @whitelabel_group = whitelabel_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whitelabel_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whitelabel_group" do
    assert_difference('WhitelabelGroup.count') do
      post :create, whitelabel_group: { address1: @whitelabel_group.address1, address2: @whitelabel_group.address2, city: @whitelabel_group.city, contact_id: @whitelabel_group.contact_id, contact_phone: @whitelabel_group.contact_phone, description: @whitelabel_group.description, email_primary: @whitelabel_group.email_primary, name: @whitelabel_group.name, state: @whitelabel_group.state, work_phone: @whitelabel_group.work_phone, zip_postal_code: @whitelabel_group.zip_postal_code }
    end

    assert_redirected_to whitelabel_group_path(assigns(:whitelabel_group))
  end

  test "should show whitelabel_group" do
    get :show, id: @whitelabel_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whitelabel_group
    assert_response :success
  end

  test "should update whitelabel_group" do
    put :update, id: @whitelabel_group, whitelabel_group: { address1: @whitelabel_group.address1, address2: @whitelabel_group.address2, city: @whitelabel_group.city, contact_id: @whitelabel_group.contact_id, contact_phone: @whitelabel_group.contact_phone, description: @whitelabel_group.description, email_primary: @whitelabel_group.email_primary, name: @whitelabel_group.name, state: @whitelabel_group.state, work_phone: @whitelabel_group.work_phone, zip_postal_code: @whitelabel_group.zip_postal_code }
    assert_redirected_to whitelabel_group_path(assigns(:whitelabel_group))
  end

  test "should destroy whitelabel_group" do
    assert_difference('WhitelabelGroup.count', -1) do
      delete :destroy, id: @whitelabel_group
    end

    assert_redirected_to whitelabel_groups_path
  end
end
