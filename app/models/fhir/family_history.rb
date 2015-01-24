module Fhir
  class FamilyHistory < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :patient, type: Types::ResourceReference
    fhir_attribute :date
    fhir_attribute :note
    fhir_attribute :relation, list: Fhir::FamilyHistoryClasses::Relation
  end
end