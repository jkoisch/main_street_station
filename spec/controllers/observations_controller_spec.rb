require 'rails_helper'

describe Fhir::ObservationsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all observations as @observations' do
      get :index, format: :json
      expect(assigns(:observations).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::ObservationsController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

    it 'performs an observation search for matching date' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, date: '1993-12-20'}
      expect(a_request(:get, 'gringotts.dev/observations').
              with(:query => hash_including({'query' => {'date' => {'value' => '1993-12-20'}}}))).to have_been_made
    end

    it 'performs an observation search for matching identifier' do
      #pending 'awaiting final param parsing'
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, identifier: '187e0c12-8dd2-67e2-99b2-bf273c878281'}
      expect(a_request(:get, 'gringotts.dev/observations').
                 with(:query => hash_including({'query' => {'identifier' => {'code' => '187e0c12-8dd2-67e2-99b2-bf273c878281'}}}))).to have_been_made
    end

    it 'performs an observation search for matching name' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, name: '8480-6'}
      expect(a_request(:get, 'gringotts.dev/observations').
                 with(:query => hash_including({'query' => {'name' => {'code' => '8480-6'}}}))).to have_been_made
    end

    it 'performs an observation search for matching patient'

    it 'performs an observation search for matching performer'

    it 'returns operation_outcome using invalid search criteria'

  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested observation as @observation' do
      get :show, id: 1, format: :json
      expect(assigns(:observation)).to be_a(Fhir::Observation)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_observation) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::ObservationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, { format: :json }, { RAW_POST_DATA: :params}
        expect(response.location).to match /Observation\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::ObservationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::ObservationsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end

  describe '#update' do
    let(:params) { FactoryGirl.json(:fhir_observation) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::ObservationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::ObservationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        put :update,  { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        put :update,  { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::ObservationsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        put :update,  { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end
end