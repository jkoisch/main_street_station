require 'test_helper'

class Registration::ContractsControllerTest < ActionController::TestCase
  setup do
    @registration_contract = registration_contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_contract" do
    assert_difference('Registration::Contract.count') do
      post :create, registration_contract: { community_id: @registration_contract.community_id, status: @registration_contract.status }
    end

    assert_redirected_to registration_contract_path(assigns(:registration_contract))
  end

  test "should show registration_contract" do
    get :show, id: @registration_contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_contract
    assert_response :success
  end

  test "should update registration_contract" do
    put :update, id: @registration_contract, registration_contract: { community_id: @registration_contract.community_id, status: @registration_contract.status }
    assert_redirected_to registration_contract_path(assigns(:registration_contract))
  end

  test "should destroy registration_contract" do
    assert_difference('Registration::Contract.count', -1) do
      delete :destroy, id: @registration_contract
    end

    assert_redirected_to registration_contracts_path
  end
end
