require 'rails_helper'

describe Fhir::PractitionersController, type: :controller do
let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all practitioners as @practitioners' do
      get :index, format: :json
      expect(assigns(:practitioners).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::PractitionersController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

    it 'performs a practitioner search for matching address' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, address: 'Galapagosweg 91'}
      expect(a_request(:get, 'gringotts.dev/providers').
                 with(:query => hash_including({'query' => {'address' => {'value' => 'Galapagosweg 91'}}}))).to have_been_made
    end

    it 'performs an practitioner search for matching communication' do
      #pending 'awaiting final param parsing'
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, communication: 'urn:oid:2.16.840.1.113883.6.121'}
      expect(a_request(:get, 'gringotts.dev/providers').
                 with(:query => hash_including({'query' => {'communication' => {'code' => 'urn:oid:2.16.840.1.113883.6.121'}}}))).to have_been_made
    end

    it 'performs an practitioner search for matching identifier' do
      #pending 'awaiting final param parsing'
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, identifier: '938273695'}
      expect(a_request(:get, 'gringotts.dev/providers').
                 with(:query => hash_including({'query' => {'identifier' => {'code' => '938273695'}}}))).to have_been_made
    end

    it 'performs an practitioner search for matching location'

    it 'returns operation_outcome using invalid search criteria'

  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested practitioner as @practitioner' do
      get :show, id: 1, format: :json
      expect(assigns(:practitioner)).to be_a(Fhir::Practitioner)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_practitioner) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::PractitionersController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response.location).to match /Practitioner\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::PractitionersController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
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
        Fhir::PractitionersController.any_instance.stubs(:create_gringotts_resource).returns(nil)
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
    let(:params) { FactoryGirl.json(:fhir_practitioner) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::PractitionersController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::PractitionersController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
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
        Fhir::PractitionersController.any_instance.stubs(:update_gringotts_resource).returns(nil)
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
