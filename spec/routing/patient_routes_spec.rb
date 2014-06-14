require 'spec_helper'

describe 'FHIR Patient' do
  describe 'provided routes' do
    specify { expect(get: fhir_Patient_path).to route_to(controller: 'fhir/patients',
                                                               action:     'index',
                                                               format:     :json) }
    specify { expect(get: '/fhir/Patient').to route_to(controller: 'fhir/patients',
                                                              action:     'index',
                                                              format:     :json) }
    specify { expect(post: fhir_Patient_path).to route_to(controller: 'fhir/patients',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(post: '/fhir/Patient').to route_to(controller: 'fhir/patients',
                                                          action:     'create',
                                                          format:     :json) }
    specify { expect(get: fhir_Patient_path(1)).to route_to(controller: 'fhir/patients',
                                                                  action:     'show',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(get: '/fhir/Patient/1').to route_to(controller: 'fhir/patients',
                                                               action:     'show',
                                                               id:         '1',
                                                               format:     :json) }
    specify { expect(put: fhir_Patient_path(1)).to route_to(controller: 'fhir/patients',
                                                                  action:     'update',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(put: '/fhir/Patient/1').to route_to(controller: 'fhir/patients',
                                                               action:     'update',
                                                               id:         '1',
                                                               format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Patient/new').not_to be_routable }
    specify { expect(get: '/fhir/Patient/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Patient/1').not_to be_routable }
  end
end