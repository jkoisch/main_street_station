require 'spec_helper'

describe Fhir::OperationOutcomesController do

  describe '#show' do
    subject { get :show, id: 0 }

    specify { should render_template(:show) }

    it 'assigns the operation_outcome' do
      get :show, id: 0
      assigns(:operation_outcome).should be_a(Fhir::OperationOutcome)
    end
  end
end
