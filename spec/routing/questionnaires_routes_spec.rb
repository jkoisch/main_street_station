require 'spec_helper'

describe 'FHIR Questionnaire' do
  describe 'provided routes' do
    specify { expect(get: fhir_Questionnaire_path).to route_to(controller: 'fhir/questionnaires',
                                                               action:     'index',
                                                               format:     :json) }
    specify { expect(get: '/fhir/Questionnaire').to route_to(controller: 'fhir/questionnaires',
                                                              action:     'index',
                                                              format:     :json) }
    specify { expect(post: fhir_Questionnaire_path).to route_to(controller: 'fhir/questionnaires',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(post: '/fhir/Questionnaire').to route_to(controller: 'fhir/questionnaires',
                                                          action:     'create',
                                                          format:     :json) }
    specify { expect(get: fhir_Questionnaire_path(1)).to route_to(controller: 'fhir/questionnaires',
                                                                  action:     'show',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(get: '/fhir/Questionnaire/1').to route_to(controller: 'fhir/questionnaires',
                                                               action:     'show',
                                                               id:         '1',
                                                               format:     :json) }
    specify { expect(put: fhir_Questionnaire_path(1)).to route_to(controller: 'fhir/questionnaires',
                                                                  action:     'update',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(put: '/fhir/Questionnaire/1').to route_to(controller: 'fhir/questionnaires',
                                                               action:     'update',
                                                               id:         '1',
                                                               format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/Questionnaire/new').not_to be_routable }
    specify { expect(get: '/fhir/Questionnaire/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Questionnaire/1').not_to be_routable }
  end
end
