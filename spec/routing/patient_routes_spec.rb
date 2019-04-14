require 'rails_helper'

describe 'FHIR Patient', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_Patient_index_path).to route_to(controller: 'fhir/patients',
                                                               action:     'index',
                                                               format:     :fhirj) }
    specify { expect(get: '/fhir/Patient').to route_to(controller: 'fhir/patients',
                                                       action:     'index',
                                                       format:     :fhirj) }
    specify { expect(get: fhir_Patient_path(1)).to route_to(controller: 'fhir/patients',
                                                            action:     'show',
                                                            id:         '1',
                                                            format:     :fhirj) }
    specify { expect(get: '/fhir/Patient/1').to route_to(controller: 'fhir/patients',
                                                         action:     'show',
                                                         id:         '1',
                                                         format:     :fhirj) }
    specify { expect(post: fhir_Patient_index_path).to route_to(controller: 'fhir/patients',
                                                                action:     'create',
                                                                format:     :fhirj) }
    specify { expect(post: '/fhir/Patient').to route_to(controller: 'fhir/patients',
                                                        action:     'create',
                                                        format:     :fhirj) }
    specify { expect(put: fhir_Patient_path(1)).to route_to(controller: 'fhir/patients',
                                                            action:     'update',
                                                            id:         '1',
                                                            format:     :fhirj) }
    specify { expect(put: '/fhir/Patient/1').to route_to(controller: 'fhir/patients',
                                                         action:     'update',
                                                         id:         '1',
                                                         format:     :fhirj) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Patient/new').not_to be_routable }
    specify { expect(get: '/fhir/patient').not_to be_routable }
    specify { expect(get: '/fhir/patient/1').not_to be_routable }
    specify { expect(post: '/fhir/patient').not_to be_routable }
    specify { expect(get: '/fhir/Patient/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/patient/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/patient/1').not_to be_routable }
    specify { expect(delete: '/fhir/Patient/1').not_to be_routable }
  end
end