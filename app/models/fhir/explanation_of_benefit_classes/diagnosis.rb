module Fhir
  module ExplanationOfBenefitClasses
    class Diagnosis < BaseClass
      fhir_attribute :sequence
      fhir_attribute :diagnosis, type: Fhir::Types::Coding
    end
  end
end