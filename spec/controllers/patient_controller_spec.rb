require 'spec_helper'

describe Fhir::PatientsController do

  describe '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the operation_outcome' do
      get :show, id: 2
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