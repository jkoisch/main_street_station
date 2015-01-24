module Fhir
  class Condition < BaseResource
    attr_accessor :onset_date, :abatement_date, :abatement_boolean

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
    fhir_attribute :onset, type_list: [Types::Age, Types::SimpleDate]
    fhir_attribute :abatement, type_list: [Types::Age, Types::SimpleDate, Types::SimpleBoolean]
    fhir_attribute :stage, type: Fhir::ConditionClasses::Stage
    fhir_attribute :evidence, list: Fhir::ConditionClasses::Evidence
    fhir_attribute :location, list: Fhir::ConditionClasses::Location
    fhir_attribute :due_to, list: Fhir::ConditionClasses::DueTo
    fhir_attribute :occurred_following, list: Fhir::ConditionClasses::OccurredFollowing
    fhir_attribute :notes
  end
end
