module Fhir
  class FamilyMemberHistory < BaseResource
    attr_accessor :born_date, :born_string,
                  :age_age, :age_range, :age_string,
                  :deceased_date, :deceased_boolean, :deceased_string

    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :patient, type: Types::ResourceReference
    fhir_attribute :date
    fhir_attribute :name
    fhir_attribute :relationship, type: Types::CodeableConcept
    fhir_attribute :gender
    fhir_attribute :born_period, type: Fhir::Types::Period
    fhir_attribute :born, type_list: [Types::SimpleString, Types::SimpleDate]
    fhir_attribute :age, type_list: [Types::Age, Types::Range, Types::SimpleString]
    fhir_attribute :deceased, type_list: [Types::SimpleString, Types::SimpleDate,
                                          Types::SimpleBoolean, Types::Age, Types::Range]
    fhir_attribute :note
    fhir_attribute :condition, list: Fhir::FamilyMemberHistoryClasses::Condition
  end
end