require 'spec_helper'

describe Fhir::QuestionnairesController do

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the operation_outcome' do
      get :show, id: 2
      assigns(:operation_outcome).should be_a(Fhir::OperationOutcome)
    end
  end
end
