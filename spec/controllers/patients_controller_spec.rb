require 'spec_helper'

describe Fhir::PatientsController do

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all patients as @patients' do
      get :index, format: :json
      assigns(:patients).count.should eq(1)
    end

    it 'interprets search criteria'
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested patient as @patient' do
      get :show, id: 1, format: :json
      assigns(:patient).should be_a(Fhir::Patient)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2
      assigns(:operation_outcome).should be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      let(:params) { ParamFaker.create(:patient) }

      it 'assigns a newly created patient as @patient' do
        post :create, patient: valid_attributes, format: :json
        assigns(:patient).should be_a(Fhir::Patient)
      end

      it 'should return a success'
      it 'should return the ID'

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