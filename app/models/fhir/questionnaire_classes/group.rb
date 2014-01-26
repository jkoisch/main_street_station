module Fhir
  module QuestionnaireClasses
    class Group < BaseClass
      fhir_attribute :name, type: Fhir::Types::CodeableConcept
      fhir_attribute :header
      fhir_attribute :text
      fhir_attribute :ordered
      # TODO: subject Resource(Any)
      fhir_attribute :group, list: Fhir::QuestionnaireClasses::Group
      fhir_attribute :question, list: Fhir::QuestionnaireClasses::Question
    end
  end
end
