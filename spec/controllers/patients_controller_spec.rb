require 'spec_helper'

describe Fhir::PatientsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json'} }

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all patients as @patients' do
      get :index, format: :json
      expect(assigns(:patients).count).to eq(1)
    end

    it 'interprets search criteria' do
      get :index, {format: :json, search: 'something'}
      pending 'needs validation of parameters'
    end
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested patient as @patient' do
      get :show, id: 1, format: :json
      expect(assigns(:patient)).to be_a(Fhir::Patient)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_patient) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, {id: 1})
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, {}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:created) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(201)
      end

      it 'should set the Location on the response' do
        post :create, {}, { RAW_POST_DATA: :params}
        expect(response.location).to match /Patient\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, {message: 'bad data'})
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        post :create, {format: :json}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:bad_request) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(400)
      end

      it 'should return an OperationOutcome' do
        post :create, {format: :json}, {RAW_POST_DATA: :params}
        response.should render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        post :create, {format: :json}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:service_unavailable) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(503)
      end

      it 'should return an OperationOutcome' do
        post :create, {format: :json}, {RAW_POST_DATA: :params}
        response.should render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end

  describe '#update' do
    let(:params) { FactoryGirl.json(:fhir_patient) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, {message: 'done'})
        Fhir::PatientsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, {id:1}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:created) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(200)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, {message: 'bad data'})
        Fhir::PatientsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        put :update, {id:1, format: :json}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:bad_request) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(400)
      end

      it 'should return an OperationOutcome' do
        put :update, {id:1, format: :json}, {RAW_POST_DATA: :params}
        response.should render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::PatientsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        put :update, {id:1, format: :json}, {RAW_POST_DATA: :params}
        # expect(response).to have_http_status(:service_unavailable) # this is the replacement for below when upgrade to RSpec 3
        response.status.should eq(503)
      end

      it 'should return an OperationOutcome' do
        put :update, {id:1, format: :json}, {RAW_POST_DATA: :params}
        response.should render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end
end