require 'rails_helper'

describe 'FHIR Observation', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_Observation_index_path).to route_to(controller: 'fhir/observations',
                                                                   action:     'index',
                                                                   format:     :fhirj) }
    specify { expect(get: '/fhir/Observation').to route_to(controller: 'fhir/observations',
                                                           action:     'index',
                                                           format:     :fhirj) }
    specify { expect(get: fhir_Observation_path(1)).to route_to(controller: 'fhir/observations',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :fhirj) }
    specify { expect(get: '/fhir/Observation/1').to route_to(controller: 'fhir/observations',
                                                             action:     'show',
                                                             id:         '1',
                                                             format:     :fhirj) }
    specify { expect(post: fhir_Observation_index_path).to route_to(controller: 'fhir/observations',
                                                                    action:     'create',
                                                                    format:     :fhirj) }
    specify { expect(post: '/fhir/Observation').to route_to(controller: 'fhir/observations',
                                                            action:     'create',
                                                            format:     :fhirj) }
    specify { expect(put: fhir_Observation_path(1)).to route_to(controller: 'fhir/observations',
                                                                action:     'update',
                                                                id:         '1',
                                                                format:     :fhirj) }
    specify { expect(put: '/fhir/Observation/1').to route_to(controller: 'fhir/observations',
                                                             action:     'update',
                                                             id:         '1',
                                                             format:     :fhirj) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Observation/new').not_to be_routable }
    specify { expect(get: '/fhir/observation').not_to be_routable }
    specify { expect(get: '/fhir/Observations').not_to be_routable }
    specify { expect(get: '/fhir/Observations/1').not_to be_routable }
    specify { expect(get: '/fhir/observation/1').not_to be_routable }
    specify { expect(post: '/fhir/observation').not_to be_routable }
    specify { expect(post: '/fhir/Observations').not_to be_routable }
    specify { expect(get: '/fhir/Observation/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Observations/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/observation/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Observation/1').not_to be_routable }
    specify { expect(delete: '/fhir/Observations/1').not_to be_routable }
    specify { expect(delete: '/fhir/observation/1').not_to be_routable }
  end
end