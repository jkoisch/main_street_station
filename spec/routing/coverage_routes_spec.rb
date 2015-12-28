require 'rails_helper'

describe 'FHIR Coverage', type: :routing do
  describe 'provided routes' do

    specify { expect(get: fhir_Coverage_index_path).to route_to(controller: 'fhir/coverages',
                                                              action:     'index',
                                                              format:     :json) }
    specify { expect(get: '/fhir/Coverage').to route_to(controller: 'fhir/coverages',
                                                      action:     'index',
                                                      format:     :json) }
    specify { expect(get: fhir_Coverage_path(1)).to route_to(controller: 'fhir/coverages',
                                                           action:     'show',
                                                           id:         '1',
                                                           format:     :json) }
    specify { expect(get: '/fhir/Coverage/1').to route_to(controller: 'fhir/coverages',
                                                        action:     'show',
                                                        id:         '1',
                                                        format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    specify { expect(get: '/fhir/coverage').not_to be_routable }
    specify { expect(get: '/fhir/Coverages').not_to be_routable }
    specify { expect(get: '/fhir/Coverages/1').not_to be_routable }
    specify { expect(get: '/fhir/coverage/1').not_to be_routable }
    specify { expect(delete: '/fhir/Coverage/1').not_to be_routable }
    specify { expect(delete: '/fhir/Coverages/1').not_to be_routable }
    specify { expect(delete: '/fhir/coverage/1').not_to be_routable }
  end
end