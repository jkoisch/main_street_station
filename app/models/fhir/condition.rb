module Fhir
  class Condition < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Fhir::Types::Identifier
    fhir_attribute :subject, type: Fhir::Types::ResourceReference
    fhir_attribute :encounter, type: Fhir::Types::ResourceReference
    fhir_attribute :asserter, type: Fhir::Types::ResourceReference
    fhir_attribute :date_asserted
    fhir_attribute :code, type: Fhir::Types::CodeableConcept
    fhir_attribute :category, type: Fhir::Types::CodeableConcept
    fhir_attribute :status
    fhir_attribute :certainty, type: Fhir::Types::CodeableConcept
    fhir_attribute :severity, type: Fhir::Types::CodeableConcept
    fhir_attribute :onset_date
    fhir_attribute :onset_age, type: Fhir::Types::Quantity
    fhir_attribute :abatement_date
    fhir_attribute :abatement_age, type: Fhir::Types::Quantity
    fhir_attribute :abatement_boolean
    fhir_attribute :stage, type: Fhir::ConditionClasses::Stage
    fhir_attribute :evidence, type: Fhir::ConditionClasses::Evidence
    fhir_attribute :location, list: Fhir::ConditionClasses::Location
    fhir_attribute :related_item, list: Fhir::ConditionClasses::RelatedItem
    fhir_attribute :notes
  end
end
