require 'spec_helper'

describe Fhir::ConditionsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all conditions as @conditions' do
      get :index, format: :json
      expect(assigns(:conditions).count).to eq(1)
    end
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
end