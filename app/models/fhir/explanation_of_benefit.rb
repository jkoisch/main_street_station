module Fhir
  class ExplanationOfBenefit < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :claim, type: Types::Reference
    fhir_attribute :claim_response, type: Types::Reference
    fhir_attribute :created
    fhir_attribute :disposition
    fhir_attribute :organization, type: Types::Reference
    fhir_attribute :patient, type: Types::Reference
    fhir_attribute :coverage, type: Fhir::ExplanationOfBenefitClasses::Coverage
    fhir_attribute :item, list: Fhir::ExplanationOfBenefitClasses::Item
    fhir_attribute :claim_total, type: Types::Quantity
    fhir_attribute :total_benefit, type: Types::Quantity
  end
end