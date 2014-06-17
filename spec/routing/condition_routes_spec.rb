require 'spec_helper'

describe 'FHIR Condition' do
  describe 'provided routes' do

    specify { expect(get: fhir_Condition_index_path).to route_to(controller: 'fhir/conditions',
                                                                   action:     'index',
                                                                   format:     :json) }
    specify { expect(get: '/fhir/Condition').to route_to(controller: 'fhir/conditions',
                                                           action:     'index',
                                                           format:     :json) }
    specify { expect(get: fhir_Condition_path(1)).to route_to(controller: 'fhir/conditions',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(get: '/fhir/Condition/1').to route_to(controller: 'fhir/conditions',
                                                             action:     'show',
                                                             id:         '1',
                                                             format:     :json) }
    specify { expect(post: fhir_Condition_index_path).to route_to(controller: 'fhir/conditions',
                                                                    action:     'create',
                                                                    format:     :json) }
    specify { expect(post: '/fhir/Condition').to route_to(controller: 'fhir/conditions',
                                                            action:     'create',
                                                            format:     :json) }
    specify { expect(put: fhir_Condition_path(1)).to route_to(controller: 'fhir/conditions',
                                                                action:     'update',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(put: '/fhir/Condition/1').to route_to(controller: 'fhir/conditions',
                                                             action:     'update',
                                                             id:         '1',
                                                             format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Condition/new').not_to be_routable }
    specify { expect(get: '/fhir/condition').not_to be_routable }
    specify { expect(get: '/fhir/Conditions').not_to be_routable }
    specify { expect(get: '/fhir/Conditions/1').not_to be_routable }
    specify { expect(get: '/fhir/condition/1').not_to be_routable }
    specify { expect(post: '/fhir/condition').not_to be_routable }
    specify { expect(post: '/fhir/Conditions').not_to be_routable }
    specify { expect(get: '/fhir/Condition/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Conditions/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/condition/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Condition/1').not_to be_routable }
    specify { expect(delete: '/fhir/Conditions/1').not_to be_routable }
    specify { expect(delete: '/fhir/condition/1').not_to be_routable }
  end
end