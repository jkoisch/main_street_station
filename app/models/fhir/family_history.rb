module Fhir
  class FamilyHistory < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :subject, type: Types::ResourceReference #Patient
    fhir_attribute :note
    fhir_attribute :relation, list: Fhir::FamilyHistoryClasses::Relation
  end
end