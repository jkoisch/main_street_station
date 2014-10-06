require 'rails_helper'

describe 'FHIR Questionnaire', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_Questionnaire_index_path).to route_to(controller: 'fhir/questionnaires',
                                                                      action:     'index',
                                                                      format:     :json) }
    specify { expect(get: '/fhir/Questionnaire').to route_to(controller: 'fhir/questionnaires',
                                                              action:     'index',
                                                              format:     :json) }
    specify { expect(get: fhir_Questionnaire_path(1)).to route_to(controller: 'fhir/questionnaires',
                                                                  action:     'show',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(get: '/fhir/Questionnaire/1').to route_to(controller: 'fhir/questionnaires',
                                                               action:     'show',
                                                               id:         '1',
                                                               format:     :json) }
    specify { expect(post: fhir_Questionnaire_index_path).to route_to(controller: 'fhir/questionnaires',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(post: '/fhir/Questionnaire').to route_to(controller: 'fhir/questionnaires',
                                                          action:     'create',
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
    specify { expect(get: '/fhir/Questionnaires').not_to be_routable }
    specify { expect(get: '/fhir/questionnaire').not_to be_routable }
    specify { expect(get: '/fhir/Questionnaires/1').not_to be_routable }
    specify { expect(get: '/fhir/questionnaire/1').not_to be_routable }
    specify { expect(post: '/fhir/Questionnaires').not_to be_routable }
    specify { expect(post: '/fhir/questionnaire').not_to be_routable }
    specify { expect(get: '/fhir/Questionnaire/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Questionnaires/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/questionnaire/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/Questionnaires').not_to be_routable }
    specify { expect(put: '/fhir/questionnaire').not_to be_routable }
    specify { expect(delete: '/fhir/Questionnaire/1').not_to be_routable }
    specify { expect(delete: '/fhir/Questionnaires/1').not_to be_routable }
    specify { expect(delete: '/fhir/questionnaire/1').not_to be_routable }
  end
end
