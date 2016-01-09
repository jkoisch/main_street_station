module Fhir
  module ExplanationOfBenefitClasses
    module ItemClasses
      class Adjudication < BaseClass
        fhir_attribute :category, type: Fhir::Types::Coding
        fhir_attribute :reason, type: Fhir::Types::Coding
        fhir_attribute :amount, type: Fhir::Types::Quantity
        fhir_attribute :value
      end
    end
  end
end