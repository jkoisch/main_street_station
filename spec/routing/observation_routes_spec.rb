require 'spec_helper'

describe 'FHIR Observation' do
  describe 'provided routes' do
    specify { expect(get: fhir_Observation_path).to route_to(controller: 'fhir/observations',
                                                               action:     'index',
                                                               format:     :json) }
    specify { expect(get: '/fhir/Observation').to route_to(controller: 'fhir/observations',
                                                             action:     'index',
                                                             format:     :json) }
    specify { expect(post: fhir_Observation_path).to route_to(controller: 'fhir/observations',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(post: '/fhir/Observation').to route_to(controller: 'fhir/observations',
                                                              action:     'create',
                                                              format:     :json) }
    specify { expect(get: fhir_Observation_path(1)).to route_to(controller: 'fhir/observations',
                                                                  action:     'show',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(get: '/fhir/Observation/1').to route_to(controller: 'fhir/observations',
                                                               action:     'show',
                                                               id:         '1',
                                                               format:     :json) }
    specify { expect(put: fhir_Observation_path(1)).to route_to(controller: 'fhir/observations',
                                                                  action:     'update',
                                                                  id:         '1',
                                                                  format:     :json) }
    specify { expect(put: '/fhir/Observation/1').to route_to(controller: 'fhir/observations',
                                                               action:     'update',
                                                               id:         '1',
                                                               format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Observation/new').not_to be_routable }
    specify { expect(get: '/fhir/Observation/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Observation/1').not_to be_routable }
  end
end