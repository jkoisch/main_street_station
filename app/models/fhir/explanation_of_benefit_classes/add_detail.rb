module Fhir
  module ExplanationOfBenefitClasses
    class AddDetail < BaseClass
      fhir_attribute :service, type: Fhir::Types::Coding
      fhir_attribute :fee, type: Fhir::Types::Quantity
      fhir_attribute :adjudication, list: Fhir::ExplanationOfBenefitClasses::Adjudication
    end
  end
end