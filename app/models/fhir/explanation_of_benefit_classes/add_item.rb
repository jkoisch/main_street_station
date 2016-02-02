module Fhir
  module ExplanationOfBenefitClasses
    class AddItem < BaseClass
      fhir_attribute :sequence_link_id, array: true
      fhir_attribute :service, type: Fhir::Types::Coding
      fhir_attribute :fee, type: Fhir::Types::Quantity
      fhir_attribute :note_number_link_id, array: true
      fhir_attribute :adjudication, list: Fhir::ExplanationOfBenefitClasses::Adjudication
      fhir_attribute :detail, list: Fhir::ExplanationOfBenefitClasses::AddDetail
    end
  end
end