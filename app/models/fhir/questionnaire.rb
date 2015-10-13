module Fhir
  class Questionnaire < BaseResource
    fhir_attribute :identifier, list: Fhir::Types::Identifier
    fhir_attribute :version
    fhir_attribute :status
    fhir_attribute :date
    fhir_attribute :publisher
    fhir_attribute :telecom, list: Fhir::Types::ContactPoint
    fhir_attribute :subject_type, array: true
    fhir_attribute :group, type: Fhir::QuestionnaireClasses::Group
  end
end


