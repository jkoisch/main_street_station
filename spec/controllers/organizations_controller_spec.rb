require 'rails_helper'

describe Fhir::OrganizationsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json'} }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all organizations as @organizations' do
      get :index, format: :json
      expect(assigns(:organizations).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::OrganizationsController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

    it 'performs an organization search for matching active' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, active: 'true'}
      expect(a_request(:get, 'gringotts.dev/organizations').
                 with(:query => hash_including({'query' => {'active' => {'code' => 'true'}}}))).to have_been_made
    end

    it 'performs an organization search for matching identifier' do
      #pending 'awaiting final param parsing'
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, identifier: 'HL7 International'}
      expect(a_request(:get, 'gringotts.dev/organizations').
                 with(:query => hash_including({'query' => {'identifier' => {'code' => 'HL7 International'}}}))).to have_been_made
    end

    it 'performs an organization search for matching name' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, name: 'Health Level Seven International'}
      expect(a_request(:get, 'gringotts.dev/organizations').
                 with(:query => hash_including({'query' => {'name' => {'value' => 'Health Level Seven International'}}}))).to have_been_made
    end

    it 'returns operation_outcome using invalid search criteria'

  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested organization as @organization' do
      get :show, id: 1, format: :json
      expect(assigns(:organization)).to be_a(Fhir::Organization)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_organization) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::OrganizationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, { format: :json }, { RAW_POST_DATA: :params}
        expect(response.location).to match /Organization\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::OrganizationsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
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
        Fhir::OrganizationsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
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
    let(:params) { FactoryGirl.json(:fhir_organization) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::OrganizationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::OrganizationsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
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
        Fhir::OrganizationsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
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