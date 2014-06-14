require 'spec_helper'

describe 'FHIR Conformance' do
  describe 'provided routes' do
    specify { expect(get: '/fhir/metadata').to route_to(controller: 'fhir/conformance',
                                                        action:     'index',
                                                        format:     :json) }
    specify { expect(get: fhir_conformance_path).to route_to(controller: 'fhir/conformance',
                                                             action:     'index',
                                                             format:     :json) }
    specify { expect(get: '/fhir/Conformance').to route_to(controller: 'fhir/conformance',
                                                           action:     'index',
                                                           format:     :json) }
    specify { expect(get: fhir_conformance_path(1)).to route_to(controller: 'fhir/conformance',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(get: '/fhir/Conformance/1').to route_to(controller: 'fhir/conformance',
                                                             action:     'show',
                                                             id:         '1',
                                                             format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Conformance/new').not_to be_routable }
    specify { expect(post: '/fhir/Conformance').not_to be_routable }
    specify { expect(get: '/fhir/Conformance/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/Conformance/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Conformance/1').not_to be_routable }
  end
end