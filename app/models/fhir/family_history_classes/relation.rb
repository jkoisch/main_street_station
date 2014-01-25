module Fhir
  module FamilyHistoryClasses
    class Relation < BaseClass
      fhir_attribute :name
      fhir_attribute :relationship, type: Fhir::Types::CodeableConcept
      fhir_attribute :born_period, type: Fhir::Types::Period
      fhir_attribute :born_date
      fhir_attribute :born_string
      fhir_attribute :deceased_boolean
      fhir_attribute :deceased_age, type: Fhir::Types::Quantity
      fhir_attribute :deceased_range, type: Fhir::Types::Range
      fhir_attribute :deceased_date
      fhir_attribute :deceased_string
      fhir_attribute :note
      fhir_attribute :condition, list: Fhir::FamilyHistoryClasses::Condition
    end
  end
end