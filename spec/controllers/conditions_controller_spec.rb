require 'rails_helper'

describe Fhir::ConditionsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all conditions as @conditions' do
      get :index, format: :json
      expect(assigns(:conditions).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::ConditionsController.any_instance.stubs(:retrieve_file_resource).returns(nil)}

    it 'performs a condition search for matching asserter' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, 'asserter' => '23'}
      expect(a_request(:get, 'gringotts.dev/conditions').
                 with(:query => hash_including({'query' => {'asserter' => {'value' => '23'}}}))).to have_been_made
    end

    it 'performs a condition search for matching category' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, category: '439401001'}
      expect(a_request(:get, 'gringotts.dev/conditions').
            with(:query => hash_including({'query' => {'category' => {'code' => '439401001'}}}))).to have_been_made
    end

    it 'performs a condition search for matching code' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, code: '39065001'}
      expect(a_request(:get, 'gringotts.dev/conditions').
                 with(:query => hash_including({'query' => {'code' => {'code' => '39065001'}}}))).to have_been_made
    end

    it 'performs a condition search for matching onset date' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, 'onset' => '2012-05-24'}
      expect(a_request(:get, 'gringotts.dev/conditions').
                 with(:query => hash_including({'query' => {'onset' => {'value' => '2012-05-24'}}}))).to have_been_made
    end

    it 'performs a condition search for matching patient reference' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, 'patient' => '23'}
      expect(a_request(:get, 'gringotts.dev/conditions').
                with(:query => hash_including({'query' => {'patient' => {'value' => '23'}}}))).to have_been_made
    end


    it 'returns operation_outcome using invalid search criteria'

  end
  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested condition as @condition' do
      get :show, id: 1, format: :json
      expect(assigns(:condition)).to be_a(Fhir::Condition)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    let(:params) { FactoryGirl.json(:fhir_condition) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { id: 1 })
        Fhir::ConditionsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:created)
      end

      it 'should set the Location on the response' do
        post :create, { format: :json }, { RAW_POST_DATA: :params }
        expect(response.location).to match /Condition\/1/
      end

    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::ConditionsController.any_instance.stubs(:create_gringotts_resource).returns(gringott_response)
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
        Fhir::ConditionsController.any_instance.stubs(:create_gringotts_resource).returns(nil)
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
    let(:params) { FactoryGirl.json(:fhir_condition) }

    context 'with valid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(true, { message: 'done' })
        Fhir::ConditionsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
      end

      it 'should return a success' do
        put :update, { format: :json, id: 1 }, { RAW_POST_DATA: :params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        gringott_response = GringottResponse.new(false, { message: 'bad data' })
        Fhir::ConditionsController.any_instance.stubs(:update_gringotts_resource).returns(gringott_response)
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
        Fhir::ConditionsController.any_instance.stubs(:update_gringotts_resource).returns(nil)
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