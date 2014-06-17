require 'spec_helper'

describe 'FHIR FamilyHistory' do
  describe 'provided routes' do
    specify { expect(get: fhir_FamilyHistory_index_path).to route_to(controller: 'fhir/family_histories',
                                                                      action:     'index',
                                                                      format:     :json) }
    specify { expect(get: '/fhir/FamilyHistory').to route_to(controller: 'fhir/family_histories',
                                                              action:     'index',
                                                              format:     :json) }
    specify { expect(get: fhir_FamilyHistory_path(1)).to route_to(controller: 'fhir/family_histories',
                                                                    action:     'show',
                                                                    id:         '1',
                                                                    format:     :json) }
    specify { expect(get: '/fhir/FamilyHistory/1').to route_to(controller: 'fhir/family_histories',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :json) }
    specify { expect(post: fhir_FamilyHistory_index_path).to route_to(controller: 'fhir/family_histories',
                                                                        action:     'create',
                                                                        format:     :json) }
    specify { expect(post: '/fhir/FamilyHistory').to route_to(controller: 'fhir/family_histories',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(put: fhir_FamilyHistory_path(1)).to route_to(controller: 'fhir/family_histories',
                                                                    action:     'update',
                                                                    id:         '1',
                                                                    format:     :json) }
    specify { expect(put: '/fhir/FamilyHistory/1').to route_to(controller: 'fhir/family_histories',
                                                                action:     'update',
                                                                id:         '1',
                                                                format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/FamilyHistory/new').not_to be_routable }
    specify { expect(get: '/fhir/FamilyHistories').not_to be_routable }
    specify { expect(get: '/fhir/familyhistory').not_to be_routable }
    specify { expect(get: '/fhir/FamilyHistories/1').not_to be_routable }
    specify { expect(get: '/fhir/familyhistory/1').not_to be_routable }
    specify { expect(post: '/fhir/FamilyHistories').not_to be_routable }
    specify { expect(post: '/fhir/familyhistory').not_to be_routable }
    specify { expect(get: '/fhir/FamilyHistory/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/FamilyHistories/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/familyhistory/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/FamilyHistories').not_to be_routable }
    specify { expect(put: '/fhir/familyhistory').not_to be_routable }
    specify { expect(delete: '/fhir/FamilyHistory/1').not_to be_routable }
    specify { expect(delete: '/fhir/FamilyHistories/1').not_to be_routable }
    specify { expect(delete: '/fhir/familyhistory/1').not_to be_routable }
  end
end