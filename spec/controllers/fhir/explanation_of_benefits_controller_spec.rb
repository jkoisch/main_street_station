require 'rails_helper'

describe Fhir::ExplanationOfBenefitsController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/fhir+json' }

  context '#index' do
    subject { get :index }

    specify { should render_template(:index) }

    it 'assigns all explanation_of_benefits as @explanation_of_benefits' do
      get :index
      expect(assigns(:explanation_of_benefits).count).to eq(1)
    end
  end

  describe '#show' do
    subject { get :show, params: {id: 1} }

    specify { should render_template(:show) }

    it 'assigns the requested explanation_of_benefit as @explanation_of_benefit' do
      get :show, params: {id: 1}
      expect(assigns(:explanation_of_benefit)).to be_a(Fhir::ExplanationOfBenefit)
    end

    it 'assigns the operation_outcome' do
      get :show, params: {id: 2}
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end
end