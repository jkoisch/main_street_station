require 'spec_helper'

describe Fhir::ObservationsController, type: :controller do
  let(:json_headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all observations as @observations' do
      get :index, format: :json
      expect(assigns(:observations).count).to eq(1)
    end
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
end