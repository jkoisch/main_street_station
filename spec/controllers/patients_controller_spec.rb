require 'spec_helper'

describe Fhir::PatientsController, type: :controller do
  let(:json_headers) { {'Accept' => 'application/json', 'Content-Type' => 'application/json'} }

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all patients as @patients' do
      get :index, format: :json
      expect(assigns(:patients).count).to eq(1)
    end

    it 'interprets search criteria'
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
    context 'with valid parameters' do
      let(:params) { FactoryGirl.json(:fhir_patient) }

      it 'assigns a newly created patient as @patient' do
        Fhir::PatientsController.any_instance.stubs(:create_gringotts_resource).returns(GringottResponse.new(true, {active:true}))
        puts params
        #puts json_headers
        #@request.env['CONTENT-TYPE'] = 'application/json'
        #@request.env['RAW_POST_DATA'] = params
        post :create, {}, {'RAW_POST_DATA' => params}
        assigns(:patient).should be_a(Fhir::Patient)
      end

      it 'should return a success' do
        post :create, {}, json_headers.merge({'RAW_POST_DATA' => params})
        expect(response).to eq(400)
      end

      it 'should return the ID' do
        post :create, {}, {'RAW_POST_DATA' => params}
      end

    end

    context 'with invalid parameters' do
      let(:params) { ParamFaker.create(:patient_invalid) }

      it 'should return a failure'
      it 'should return an OperationOutcome'
    end
  end

  describe '#update' do
    context 'with valid parameters' do

    end

    context 'with invalid parameters' do

    end
  end
end