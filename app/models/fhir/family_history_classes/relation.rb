module Fhir
  module FamilyHistoryClasses
    class Relation < BaseClass
      attr_accessor :born_date, :born_string, :deceased_date, :deceased_boolean, :deceased_string

      fhir_attribute :name
      fhir_attribute :relationship, type: Fhir::Types::CodeableConcept
      fhir_attribute :born_period, type: Fhir::Types::Period
      fhir_attribute :born, type_list: [Types::SimpleString, Types::SimpleDate]
      fhir_attribute :deceased, type_list: [Types::SimpleString, Types::SimpleDate,
                                           Types::SimpleBoolean, Types::Age, Types::Range]
      fhir_attribute :note
      fhir_attribute :condition, list: Fhir::FamilyHistoryClasses::Condition
    end
  end
end