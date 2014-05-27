require 'test_helper'

class Registration::WhitelabelsControllerTest < ActionController::TestCase
  setup do
    @registration_whitelabel = registration_whitelabels(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_whitelabels)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create registration_whitelabel' do
    assert_difference('Registration::Whitelabel.count') do
      post :create, registration_whitelabel: { address1: @registration_whitelabel.address1, address2: @registration_whitelabel.address2, city: @registration_whitelabel.city, contact_id: @registration_whitelabel.contact_id, contact_phone: @registration_whitelabel.contact_phone, description: @registration_whitelabel.description, email_primary: @registration_whitelabel.email_primary, name: @registration_whitelabel.name, state: @registration_whitelabel.state, work_phone: @registration_whitelabel.work_phone, zip_postal_code: @registration_whitelabel.zip_postal_code }
    end

    assert_redirected_to registration_whitelabel_path(assigns(:registration_whitelabel))
  end

  test 'should show_old registration_whitelabel' do
    get :show_old, id: @registration_whitelabel
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @registration_whitelabel
    assert_response :success
  end

  test 'should update registration_whitelabel' do
    put :update, id: @registration_whitelabel, registration_whitelabel: { address1: @registration_whitelabel.address1, address2: @registration_whitelabel.address2, city: @registration_whitelabel.city, contact_id: @registration_whitelabel.contact_id, contact_phone: @registration_whitelabel.contact_phone, description: @registration_whitelabel.description, email_primary: @registration_whitelabel.email_primary, name: @registration_whitelabel.name, state: @registration_whitelabel.state, work_phone: @registration_whitelabel.work_phone, zip_postal_code: @registration_whitelabel.zip_postal_code }
    assert_redirected_to registration_whitelabel_path(assigns(:registration_whitelabel))
  end

  test 'should destroy registration_whitelabel' do
    assert_difference('Registration::Whitelabel.count', -1) do
      delete :destroy, id: @registration_whitelabel
    end

    assert_redirected_to registration_whitelabels_path
  end
end
