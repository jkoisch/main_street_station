require 'rails_helper'

describe Fhir::LocationsController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/fhir+json' }

  context '#index' do
    subject { get :index }

    specify { should render_template(:index) }

    it 'assigns all locations as @locations' do
      get :index
      expect(assigns(:locations).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::LocationsController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

    it 'performs a location search for matching address' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, params: {address: 'Galapagosweg 91, Building A'}
      expect(a_request(:get, 'gringotts.dev/locations').
                 with(:query => hash_including({'query' => {'address' => {'value' => 'Galapagosweg 91, Building A'}}}))).to have_been_made
    end

    it 'performs a location search for matching identifier' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, params: {identifier: '54-08976-23'}
      expect(a_request(:get, 'gringotts.dev/locations').
                 with(:query => hash_including({'query' => {'identifier' => {'code' => '54-08976-23'}}}))).to have_been_made
    end

    it 'performs a location search for matching name' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, params: {name: 'South Wing, second floor'}
      expect(a_request(:get, 'gringotts.dev/locations').
                 with(:query => hash_including({'query' => {'name' => {'value' => 'South Wing, second floor'}}}))).to have_been_made
    end

    it 'performs a location search for matching near' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, params: {near: '4.844614000123024,52.37799399970903'}
      expect(a_request(:get, 'gringotts.dev/locations').
                 with(:query => hash_including({'query' => {'near' => {'code' => '4.844614000123024,52.37799399970903'}}}))).to have_been_made
    end

    it 'performs a location search for matching near_distance'

    it 'returns operation_outcome using invalid search criteria'
  end

  describe '#show' do
    subject { get :show, params: {id: 1} }

    specify { should render_template(:show) }

    it 'assigns the requested location as @location' do
      get :show, params: {id: 1}
      expect(assigns(:location)).to be_a(Fhir::Location)
    end

    it 'assigns the operation_outcome' do
      get :show, params: {id: 2}
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_location) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::LocationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response.location).to match /Location\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::LocationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::LocationsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        post :create, params: { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end

  describe '#update' do
    let(:params) { FactoryGirl.json(:fhir_location) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::LocationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, params: {id: 1, RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::LocationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        put :update, params: {id: 1, RAW_POST_DATA: :params }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        put :update, params: {id: 1, RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::LocationsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        put :update, params: {id: 1, RAW_POST_DATA: :params }
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        put :update, params: {id: 1, RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end
end