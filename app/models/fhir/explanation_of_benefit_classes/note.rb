module Fhir
  module ExplanationOfBenefitClasses
    class Note < BaseClass
      fhir_attribute :number
      fhir_attribute :type, type: Types::Coding
      fhir_attribute :text
    end
  end
end