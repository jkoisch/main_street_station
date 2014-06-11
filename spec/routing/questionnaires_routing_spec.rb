require 'spec_helper'

describe Fhir::QuestionnairesController do
  describe 'routing' do

    it 'routes to #show' do
      get('/fhir/Questionnaire/1').should route_to('fhir/operation_outcomes#show', id: '0', format: :json)
    end
  end
end
