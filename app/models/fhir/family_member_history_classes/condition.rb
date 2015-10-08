module Fhir
  module FamilyMemberHistoryClasses
    class Condition < BaseClass
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :outcome, type: Fhir::Types::CodeableConcept
      fhir_attribute :onset, type_list: [Types::Quantity, Types::Range, Types::Period, Types::SimpleString]
      fhir_attribute :note
    end
  end
end