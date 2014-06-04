require 'spec_helper'

describe Fhir::OperationOutcomesController do
  describe 'routing' do

    it 'routes to #show' do
      get('/fhir/operation_outcomes/0').should route_to('fhir/operation_outcomes#show', id: '0', format: :json)
    end
  end
end
