require 'rails_helper'

describe Fhir::ExplanationOfBenefitsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all explanation_of_benefits as @explanation_of_benefits' do
      get :index, format: :json
      expect(assigns(:explanation_of_benefits).count).to eq(1)
    end
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested explanation_of_benefit as @explanation_of_benefit' do
      get :show, id: 1, format: :json
      expect(assigns(:explanation_of_benefit)).to be_a(Fhir::ExplanationOfBenefit)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end
end