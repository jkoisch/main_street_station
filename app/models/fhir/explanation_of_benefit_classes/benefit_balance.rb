module Fhir
  module ExplanationOfBenefitClasses
    class BenefitBalance < BaseClass
      fhir_attribute :category, type: Types::Coding
      fhir_attribute :sub_category, type: Types::Coding
      fhir_attribute :network, type: Types::Coding
      fhir_attribute :unit, type: Types::Coding
      fhir_attribute :term, type: Types::Coding
      fhir_attribute :financial, list: Fhir::ExplanationOfBenefitClasses::BenefitBalanceClasses::Financial
    end
  end
end