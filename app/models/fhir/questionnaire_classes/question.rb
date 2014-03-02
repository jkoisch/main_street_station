module Fhir
  module QuestionnaireClasses
    class Question < BaseClass
      fhir_attribute :name, type: Fhir::Types::CodeableConcept
      fhir_attribute :text
      fhir_attribute :answer_decimal
      fhir_attribute :answer_integer
      fhir_attribute :answer_boolean
      fhir_attribute :answer_date
      fhir_attribute :answer_string
      fhir_attribute :answer_datetime
      fhir_attribute :answer_instant
      fhir_attribute :choice, list: Fhir::Types::Coding
      # TODO: options Resource(ValueSet)
      # TODO: fhir_attribute :data
      fhir_attribute :remarks
      fhir_attribute :group, list: Fhir::QuestionnaireClasses::Group
    end
  end
end