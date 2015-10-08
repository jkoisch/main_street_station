module Fhir
  module QuestionnaireClasses
    class Group < BaseClass
      fhir_attribute :link_id
      fhir_attribute :title
      fhir_attribute :concept, list: Fhir::Types::Coding
      fhir_attribute :text
      fhir_attribute :required
      fhir_attribute :repeats
      fhir_attribute :group, list: Fhir::QuestionnaireClasses::Group
      fhir_attribute :question, list: Fhir::QuestionnaireClasses::Question
    end
  end
end
