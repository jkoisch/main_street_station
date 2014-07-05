require 'spec_helper'

describe Fhir::QuestionnairesController do

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all questionnaires as @questionnaires' do
      get :index, format: :json
      expect(assigns(:questionnaires).count).to eq(1)
    end
  end

  describe '#show', :focus do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested questionnaire as @questionnaire' do
      get :show, id: 1, format: :json
      expect(assigns(:questionnaire)).to be_a(Fhir::Questionnaire)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      assigns(:operation_outcome).should be_a(Fhir::OperationOutcome)
    end
  end

  describe '#create' do
    context 'with valid parameters' do

    end

    context 'with invalid parameters' do

    end
  end

  describe '#update' do
    context 'with valid parameters' do

    end

    context 'with invalid parameters' do

    end
  end
end
