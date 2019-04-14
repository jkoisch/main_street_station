require 'rails_helper'

describe Fhir::PatientsController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/fhir+json' }

  context '#index' do
    subject { get :index }

    specify { should render_template(:index) }

    it 'assigns all patients as @patients' do
      get :index
      expect(assigns(:patients).count).to eq(1)
    end

    context 'for searches' do
      before(:each) {Fhir::PatientsController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

      it 'returns patients using search criteria: active' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {active: 'true'}
        expect(a_request(:get, 'gringotts.dev/clients').
                  with(:query => hash_including({'query' => {'active' => {'code' => 'true'}}}))).to have_been_made
      end

      it 'performs a patient search for matching address' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {address: '-40C Hoth St., Edmonton, AB'}
        expect(a_request(:get, 'gringotts.dev/clients').
                   with(:query => hash_including({'query' => {'address' => {'value' => '-40C Hoth St., Edmonton, AB'}}}))).to have_been_made
      end

      it 'performs a patient search for matching birthdate' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {birthdate: '1993-12-20'}
        expect(a_request(:get, 'gringotts.dev/clients').
                  with(:query => hash_including({'query' => {'birthdate' => {'value' => '1993-12-20'}}}))).to have_been_made
      end

      it 'performs a patient search for matching family' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {family: 'Skywalker'}
        expect(a_request(:get, 'gringotts.dev/clients').
                  with(:query => hash_including({'query' => {'family' => {'value' => 'Skywalker'}}}))).to have_been_made
      end

      it 'performs a patient search for matching gender' do
        #pending 'awaiting final param parsing'
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {gender: 'male'}
        expect(a_request(:get, 'gringotts.dev/clients').
                   with(:query => hash_including({'query' => {'gender' => {'code' => 'male'}}}))).to have_been_made
      end

      it 'performs a patient search for matching given' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {given: 'Han'}
        expect(a_request(:get, 'gringotts.dev/clients').
                  with(:query => hash_including({'query' => {'given' => {'value' => 'Han'}}}))).to have_been_made
      end

      it 'performs a patient search for matching identifier' do
        #pending 'awaiting final param parsing'
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {identifier: '54-08976-23'}
        expect(a_request(:get, 'gringotts.dev/clients').
                   with(:query => hash_including({'query' => {'identifier' => {'code' => '54-08976-23'}}}))).to have_been_made
      end

      it 'performs a patient search for matching name' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {name: 'Solo'}
        expect(a_request(:get, 'gringotts.dev/clients').
                   with(:query => hash_including({'query' => {'name' => {'value' => 'Solo'}}}))).to have_been_made
      end

      it 'performs a patient search for matching telecom' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {telecom: '7809030885'}
        expect(a_request(:get, 'gringotts.dev/clients').
                  with(:query => hash_including({'query' => {'telecom' => {'code' => '7809030885'}}}))).to have_been_made
      end

      it 'processes multiple search criteria for same parameter' do
        stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, params: {name: 'Solo', 'name:exact' => 'Han'}
        #expect(a_request(:get, 'gringotts.dev/clients').
        #           with(:query => hash_including({'query' => {'name' => [{'value' => 'Solo'},{'value' => 'Han'}]}}))).to have_been_made
      end

      it 'returns operation_outcome using invalid search criteria'
    end

  end

  describe '#show' do
    subject { get :show, params: {id: 1} }

    specify { should render_template(:show) }

    it 'assigns the requested patient as @patient' do
      get :show, params: {id: 1}
      expect(assigns(:patient)).to be_a(Fhir::Patient)
    end

    it 'assigns the operation_outcome' do
      get :show, params: {id: 2}
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
        post :create, params: {RAW_POST_DATA: :params}
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, params: { RAW_POST_DATA: :params}
        expect(response.location).to match /Patient\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, {message: 'bad data'})
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        post :create, params: {RAW_POST_DATA: :params}
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        post :create, params: {RAW_POST_DATA: :params}
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        post :create, params: {RAW_POST_DATA: :params}
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        post :create, params: {RAW_POST_DATA: :params}
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
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
        put :update, params: {id:1, RAW_POST_DATA: :params}
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, {message: 'bad data'})
        Fhir::PatientsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        put :update, params: {id:1, RAW_POST_DATA: :params}
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        put :update, params: {id:1, RAW_POST_DATA: :params}
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::PatientsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        put :update, params: {id:1, RAW_POST_DATA: :params}
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        put :update, params: {id:1, RAW_POST_DATA: :params}
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end
end