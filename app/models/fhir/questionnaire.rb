module Fhir
  class Questionnaire < BaseResource
    fhir_attribute :status
    fhir_attribute :authored
    # TODO: subject Resource(Patient|RelatedPerson)
    # TODO: author Resource(Practitioner|Patient|RelatedPerson)
    # TODO: source Resource(Patient|Practitioner|RelatedPerson)
    fhir_attribute :name, type: Fhir::Types::CodeableConcept
    fhir_attribute :identifier, list: Fhir::Types::Identifier
    # TODO: encounter Resource(Encounter)
    fhir_attribute :group, type: Fhir::QuestionnaireClasses::Group
  end
end


