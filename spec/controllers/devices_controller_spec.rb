require 'rails_helper'

describe Fhir::DevicesController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all devices as @devices' do
      get :index, format: :json
      expect(assigns(:devices).count).to eq(1)
    end

    context 'for searches' do
      before(:each) {Fhir::DevicesController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

      it 'performs a device search for matching identifier' do
        stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, {format: :json, identifier: 'AMID-342135-8464'}
        expect(a_request(:get, 'gringotts.dev/devices').
                  with(:query => hash_including({'query' => {'identifier' => {'code' => 'AMID-342135-8464'}}}))).to have_been_made
      end

      it 'performs a device search for matching manufacturer' do
        stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, {format: :json, manufacturer: 'Acme Devices, Inc'}
        expect(a_request(:get, 'gringotts.dev/devices').
                   with(:query => hash_including({'query' => {'manufacturer' => {'value' => 'Acme Devices, Inc'}}}))).to have_been_made
      end

      it 'performs a device search for matching model' do
        stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, {format: :json, model: 'AB 45-J'}
        expect(a_request(:get, 'gringotts.dev/devices').
                   with(:query => hash_including({'query' => {'model' => {'value' => 'AB 45-J'}}}))).to have_been_made
      end

      it 'performs a device search for matching patient'

      it 'performs a device search for matching type' do
        stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, {format: :json, type: '86184003'}
        expect(a_request(:get, 'gringotts.dev/devices').
                   with(:query => hash_including({'query' => {'type' => {'code' => '86184003'}}}))).to have_been_made
      end

      it 'performs a device search for matching udi' do
        stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
        get :index, {format: :json, udi: 'xo98-s3'}
        expect(a_request(:get, 'gringotts.dev/devices').
                   with(:query => hash_including({'query' => {'udi' => {'value' => 'xo98-s3'}}}))).to have_been_made
      end

      it 'returns operation_outcome using invalid search criteria'

    end
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested device as @device' do
      get :show, id: 1, format: :json
      expect(assigns(:device)).to be_a(Fhir::Device)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_device) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::DevicesController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response.location).to match /Device\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::DevicesController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
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
        Fhir::DevicesController.any_instance.stubs(:create_gringotts_resource).returns(nil)
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
    let(:params) { FactoryGirl.json(:fhir_device) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::DevicesController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::DevicesController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a bad request' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an OperationOutcome' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end

    context 'with Gringotts down' do
      before(:each) do
        Fhir::DevicesController.any_instance.stubs(:update_gringotts_resource).returns(nil)
      end

      it 'should return a service unavailable' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'should return an OperationOutcome' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to render_template 'fhir/fhir_base/operation_outcome'
      end
    end
  end

end