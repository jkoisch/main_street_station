require 'rails_helper'

describe 'FHIR FamilyMemberHistory', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_FamilyMemberHistory_index_path).to route_to(controller: 'fhir/family_member_histories',
                                                                      action:     'index',
                                                                      format:     :fhirj) }
    specify { expect(get: '/fhir/FamilyMemberHistory').to route_to(controller: 'fhir/family_member_histories',
                                                              action:     'index',
                                                              format:     :fhirj) }
    specify { expect(get: fhir_FamilyMemberHistory_path(1)).to route_to(controller: 'fhir/family_member_histories',
                                                                    action:     'show',
                                                                    id:         '1',
                                                                    format:     :fhirj) }
    specify { expect(get: '/fhir/FamilyMemberHistory/1').to route_to(controller: 'fhir/family_member_histories',
                                                                action:     'show',
                                                                id:         '1',
                                                                format:     :fhirj) }
    specify { expect(post: fhir_FamilyMemberHistory_index_path).to route_to(controller: 'fhir/family_member_histories',
                                                                        action:     'create',
                                                                        format:     :fhirj) }
    specify { expect(post: '/fhir/FamilyMemberHistory').to route_to(controller: 'fhir/family_member_histories',
                                                                action:     'create',
                                                                format:     :fhirj) }
    specify { expect(put: fhir_FamilyMemberHistory_path(1)).to route_to(controller: 'fhir/family_member_histories',
                                                                    action:     'update',
                                                                    id:         '1',
                                                                    format:     :fhirj) }
    specify { expect(put: '/fhir/FamilyMemberHistory/1').to route_to(controller: 'fhir/family_member_histories',
                                                                action:     'update',
                                                                id:         '1',
                                                                format:     :fhirj) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/FamilyHistory/new').not_to be_routable }
    specify { expect(get: '/fhir/FamilyMemberHistories').not_to be_routable }
    specify { expect(get: '/fhir/familymemberhistory').not_to be_routable }
    specify { expect(get: '/fhir/FamilyMemberHistories/1').not_to be_routable }
    specify { expect(get: '/fhir/familymemberhistory/1').not_to be_routable }
    specify { expect(post: '/fhir/FamilyMemberHistories').not_to be_routable }
    specify { expect(post: '/fhir/familymemberhistory').not_to be_routable }
    specify { expect(get: '/fhir/FamilyMemberHistory/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/FamilyMemberHistories/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/familymemberhistory/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/FamilyMemberHistories').not_to be_routable }
    specify { expect(put: '/fhir/familymemberhistory').not_to be_routable }
    specify { expect(delete: '/fhir/FamilyMemberHistory/1').not_to be_routable }
    specify { expect(delete: '/fhir/FamilyMemberHistories/1').not_to be_routable }
    specify { expect(delete: '/fhir/familymemberhistory/1').not_to be_routable }
  end
end