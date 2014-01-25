module Fhir
  module FamilyHistoryClasses
    class Condition < BaseClass
      fhir_attribute :type, type: Fhir::Types::CodeableConcept
      fhir_attribute :outcome, type: Fhir::Types::CodeableConcept
      fhir_attribute :onset_age, type: Fhir::Types::Quantity
      fhir_attribute :onset_range, type: Fhir::Types::Range
      fhir_attribute :onset_string
      fhir_attribute :note
    end
  end
end