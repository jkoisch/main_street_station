require 'rails_helper'

describe 'FHIR Practitioner', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_Practitioner_index_path).to route_to(controller: 'fhir/practitioners',
                                                                     action:     'index',
                                                                     format:     :fhirj) }
    specify { expect(get: '/fhir/Practitioner').to route_to(controller: 'fhir/practitioners',
                                                             action:     'index',
                                                             format:     :fhirj) }
    specify { expect(get: fhir_Practitioner_path(1)).to route_to(controller: 'fhir/practitioners',
                                                                  action:     'show',
                                                                  id:         '1',
                                                                  format:     :fhirj) }
    specify { expect(get: '/fhir/Practitioner/1').to route_to(controller: 'fhir/practitioners',
                                                               action:     'show',
                                                               id:         '1',
                                                               format:     :fhirj) }
    specify { expect(post: fhir_Practitioner_index_path).to route_to(controller: 'fhir/practitioners',
                                                                      action:     'create',
                                                                      format:     :fhirj) }
    specify { expect(post: '/fhir/Practitioner').to route_to(controller: 'fhir/practitioners',
                                                              action:     'create',
                                                              format:     :fhirj) }
    specify { expect(put: fhir_Practitioner_path(1)).to route_to(controller: 'fhir/practitioners',
                                                                  action:     'update',
                                                                  id:         '1',
                                                                  format:     :fhirj) }
    specify { expect(put: '/fhir/Practitioner/1').to route_to(controller: 'fhir/practitioners',
                                                               action:     'update',
                                                               id:         '1',
                                                               format:     :fhirj) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/Practitioner/new').not_to be_routable }
    specify { expect(get: '/fhir/Practitioners').not_to be_routable }
    specify { expect(get: '/fhir/practitioner').not_to be_routable }
    specify { expect(get: '/fhir/Practitioners/1').not_to be_routable }
    specify { expect(get: '/fhir/practitioner/1').not_to be_routable }
    specify { expect(post: '/fhir/Practitioners').not_to be_routable }
    specify { expect(post: '/fhir/practitioner').not_to be_routable }
    specify { expect(get: '/fhir/Practitioner/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Practitioners/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/practitioner/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/Practitioners').not_to be_routable }
    specify { expect(put: '/fhir/practitioner').not_to be_routable }
    specify { expect(delete: '/fhir/Practitioner/1').not_to be_routable }
    specify { expect(delete: '/fhir/Practitioners/1').not_to be_routable }
    specify { expect(delete: '/fhir/practitioner/1').not_to be_routable }
  end
end
