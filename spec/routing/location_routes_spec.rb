require 'spec_helper'

describe 'FHIR Location' do
  describe 'provided routes' do
    specify { expect(get: fhir_Location_index_path).to route_to(controller: 'fhir/locations',
                                                                    action:     'index',
                                                                    format:     :json) }
    specify { expect(get: '/fhir/Location').to route_to(controller: 'fhir/locations',
                                                            action:     'index',
                                                            format:     :json) }
    specify { expect(get: fhir_Location_path(1)).to route_to(controller: 'fhir/locations',
                                                                 action:     'show',
                                                                 id:         '1',
                                                                 format:     :json) }
    specify { expect(get: '/fhir/Location/1').to route_to(controller: 'fhir/locations',
                                                              action:     'show',
                                                              id:         '1',
                                                              format:     :json) }
    specify { expect(post: fhir_Location_index_path).to route_to(controller: 'fhir/locations',
                                                                     action:     'create',
                                                                     format:     :json) }
    specify { expect(post: '/fhir/Location').to route_to(controller: 'fhir/locations',
                                                             action:     'create',
                                                             format:     :json) }
    specify { expect(put: fhir_Location_path(1)).to route_to(controller: 'fhir/locations',
                                                                 action:     'update',
                                                                 id:         '1',
                                                                 format:     :json) }
    specify { expect(put: '/fhir/Location/1').to route_to(controller: 'fhir/locations',
                                                              action:     'update',
                                                              id:         '1',
                                                              format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/Location/new').not_to be_routable }
    specify { expect(get: '/fhir/Locations').not_to be_routable }
    specify { expect(get: '/fhir/location').not_to be_routable }
    specify { expect(get: '/fhir/Locations/1').not_to be_routable }
    specify { expect(get: '/fhir/location/1').not_to be_routable }
    specify { expect(post: '/fhir/Locations').not_to be_routable }
    specify { expect(post: '/fhir/location').not_to be_routable }
    specify { expect(get: '/fhir/Location/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Locations/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/location/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/Locations').not_to be_routable }
    specify { expect(put: '/fhir/location').not_to be_routable }
    specify { expect(delete: '/fhir/Location/1').not_to be_routable }
    specify { expect(delete: '/fhir/Locations/1').not_to be_routable }
    specify { expect(delete: '/fhir/location/1').not_to be_routable }
  end
end
