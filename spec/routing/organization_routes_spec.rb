require 'rails_helper'

describe 'FHIR Organization', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_Organization_index_path).to route_to(controller: 'fhir/organizations',
                                                                   action:     'index',
                                                                   format:     :json) }
    specify { expect(get: '/fhir/Organization').to route_to(controller: 'fhir/organizations',
                                                           action:     'index',
                                                           format:     :json) }
    specify { expect(get: fhir_Organization_path(1)).to route_to(controller: 'fhir/organizations',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(get: '/fhir/Organization/1').to route_to(controller: 'fhir/organizations',
                                                             action:     'show',
                                                             id:         '1',
                                                             format:     :json) }
    specify { expect(post: fhir_Organization_index_path).to route_to(controller: 'fhir/organizations',
                                                                    action:     'create',
                                                                    format:     :json) }
    specify { expect(post: '/fhir/Organization').to route_to(controller: 'fhir/organizations',
                                                            action:     'create',
                                                            format:     :json) }
    specify { expect(put: fhir_Organization_path(1)).to route_to(controller: 'fhir/organizations',
                                                                action:     'update',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(put: '/fhir/Organization/1').to route_to(controller: 'fhir/organizations',
                                                             action:     'update',
                                                             id:         '1',
                                                             format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Organization/new').not_to be_routable }
    specify { expect(get: '/fhir/organization').not_to be_routable }
    specify { expect(get: '/fhir/Organizations').not_to be_routable }
    specify { expect(get: '/fhir/Organizations/1').not_to be_routable }
    specify { expect(get: '/fhir/organization/1').not_to be_routable }
    specify { expect(post: '/fhir/organization').not_to be_routable }
    specify { expect(post: '/fhir/Organizations').not_to be_routable }
    specify { expect(get: '/fhir/Organization/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Organizations/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/organization/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Organization/1').not_to be_routable }
    specify { expect(delete: '/fhir/Organizations/1').not_to be_routable }
    specify { expect(delete: '/fhir/organization/1').not_to be_routable }
  end
end