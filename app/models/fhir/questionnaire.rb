module Fhir
  class Questionnaire < BaseResource
    fhir_attribute :id
    fhir_attribute :status
    fhir_attribute :authored
    fhir_attribute :subject, type: Fhir::Types::Reference #Patient|RelatedPerson
    fhir_attribute :author, type: Fhir::Types::Reference #Practitioner|Patient|RelatedPerson
    fhir_attribute :source, type: Fhir::Types::Reference #Patient|Practitioner|RelatedPerson
    fhir_attribute :name, type: Fhir::Types::CodeableConcept
    fhir_attribute :identifier, list: Fhir::Types::Identifier
    fhir_attribute :encounter, type: Fhir::Types::Reference #Encounter
    fhir_attribute :group, type: Fhir::QuestionnaireClasses::Group
  end
end


