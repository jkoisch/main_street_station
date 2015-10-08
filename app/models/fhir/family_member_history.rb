module Fhir
  class FamilyMemberHistory < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :patient, type: Types::Reference
    fhir_attribute :date
    fhir_attribute :status
    fhir_attribute :name
    fhir_attribute :relationship, type: Types::CodeableConcept
    fhir_attribute :gender
    fhir_attribute :born, type_list: [Types::Period, Types::SimpleDate, Types::SimpleString]
    fhir_attribute :age, type_list: [Types::Quantity, Types::Range, Types::SimpleString]
    fhir_attribute :deceased, type_list: [Types::SimpleBoolean, Types::Quantity, Types::Range,
                                          Types::SimpleDate, Types::SimpleString]
    fhir_attribute :note, type: Fhir::Types::Annotation
    fhir_attribute :condition, list: Fhir::FamilyMemberHistoryClasses::Condition
  end
end