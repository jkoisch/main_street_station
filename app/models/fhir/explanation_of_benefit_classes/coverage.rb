module Fhir
  module ExplanationOfBenefitClasses
    class Coverage < BaseClass
      fhir_attribute :coverage, type: Fhir::Types::Reference
      fhir_attribute :relationship, type: Fhir::Types::Coding
      fhir_attribute :pre_auth_ref, type_list: [Types::SimpleString]
    end
  end
end