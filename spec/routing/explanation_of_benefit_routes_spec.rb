require 'rails_helper'

describe 'FHIR ExplanationOfBenefit', type: :routing do
  describe 'provided routes' do
    specify { expect(get: fhir_ExplanationOfBenefit_index_path).to route_to(controller: 'fhir/explanation_of_benefits',
                                                                           action:     'index',
                                                                           format:     :json) }
    specify { expect(get: '/fhir/ExplanationOfBenefit').to route_to(controller: 'fhir/explanation_of_benefits',
                                                                   action:     'index',
                                                                   format:     :json) }
    specify { expect(get: fhir_ExplanationOfBenefit_path(1)).to route_to(controller: 'fhir/explanation_of_benefits',
                                                                        action:     'show',
                                                                        id:         '1',
                                                                        format:     :json) }
    specify { expect(get: '/fhir/ExplanationOfBenefit/1').to route_to(controller: 'fhir/explanation_of_benefits',
                                                                     action:     'show',
                                                                     id:         '1',
                                                                     format:     :json) }
  end

  describe 'forbidden routes' do
    specify { expect(get: '/fhir/ExplanationOfBenefits').not_to be_routable }
    specify { expect(get: '/fhir/explanationofbenefit').not_to be_routable }
    specify { expect(get: '/fhir/ExplanationOfBenefits/1').not_to be_routable }
    specify { expect(get: '/fhir/explanationofbenefit/1').not_to be_routable }
    specify { expect(post: '/fhir/ExplanationOfBenefit').not_to be_routable }
    specify { expect(post: '/fhir/ExplanationOfBenefits').not_to be_routable }
    specify { expect(post: '/fhir/explanationofbenefit').not_to be_routable }
    specify { expect(get: '/fhir/ExplanationOfBenefit/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/ExplanationOfBenefits/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/explanationofbenefit/edit/1').not_to be_routable }
    specify { expect(put: '/fhir/ExplanationOfBenefit').not_to be_routable }
    specify { expect(put: '/fhir/ExplanationOfBenefits').not_to be_routable }
    specify { expect(put: '/fhir/explanationofbenefit').not_to be_routable }
    specify { expect(delete: '/fhir/ExplanationOfBenefit/1').not_to be_routable }
    specify { expect(delete: '/fhir/ExplanationOfBenefits/1').not_to be_routable }
    specify { expect(delete: '/fhir/explanationofbenefit/1').not_to be_routable }
  end
end