module Fhir
  module ExplanationOfBenefitClasses
    class MissingTeeth < BaseClass
      fhir_attribute :tooth, type: Fhir::Types::Coding
      fhir_attribute :reason, type: Fhir::Types::Coding
      fhir_attribute :extraction_date
    end
  end
end