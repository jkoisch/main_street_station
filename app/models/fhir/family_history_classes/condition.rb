module Fhir
  module FamilyHistoryClasses
    class Condition < BaseClass
      attr_accessor :onset_string

      fhir_attribute :type, type: Fhir::Types::CodeableConcept
      fhir_attribute :outcome, type: Fhir::Types::CodeableConcept
      fhir_attribute :onset, type_list: [Types::SimpleString, Types::Age, Types::Range]
      fhir_attribute :note
    end
  end
end