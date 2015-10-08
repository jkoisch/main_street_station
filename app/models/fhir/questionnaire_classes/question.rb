module Fhir
  module QuestionnaireClasses
    class Question < BaseClass
      fhir_attribute :link_id
      fhir_attribute :concept, list: Fhir::Types::Coding
      fhir_attribute :text
      fhir_attribute :type
      fhir_attribute :required
      fhir_attribute :repeats
      fhir_attribute :options, type: Fhir::Types::Reference #ValueSet
      fhir_attribute :option, list: Fhir::Types::Coding
      fhir_attribute :group, list: Fhir::QuestionnaireClasses::Group
    end
  end
end
