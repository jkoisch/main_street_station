module Fhir
  module ExplanationOfBenefitClasses
    class Payee < BaseClass
      fhir_attribute :type, type: Fhir::Types::Coding
      fhir_attribute :provider, type: Fhir::Types::Reference
      fhir_attribute :organization, type: Fhir::Types::Reference
      fhir_attribute :person, type: Fhir::Types::Reference
    end
  end
end