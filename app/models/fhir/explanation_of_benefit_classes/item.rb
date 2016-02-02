module Fhir
  module ExplanationOfBenefitClasses
    class Item < BaseClass
      fhir_attribute :sequence
      fhir_attribute :type, type: Fhir::Types::Coding
      fhir_attribute :provider, type: Fhir::Types::Reference
      fhir_attribute :diagnosis_link_id, array: true
      fhir_attribute :service, type: Fhir::Types::Coding
      fhir_attribute :serviced, type_list: [Types::SimpleDate, Types::Period]
      fhir_attribute :place, type: Fhir::Types::Coding
      fhir_attribute :quantity, type: Fhir::Types::Quantity
      fhir_attribute :unit_price, type: Fhir::Types::Quantity
      fhir_attribute :factor
      fhir_attribute :points
      fhir_attribute :net, type: Fhir::Types::Quantity
      fhir_attribute :udi, type: Fhir::Types::Coding
      fhir_attribute :body_site, type: Fhir::Types::Coding
      fhir_attribute :sub_site, list: Fhir::Types::Coding
      fhir_attribute :modifier, list: Fhir::Types::Coding
      fhir_attribute :note_number, array: true
      fhir_attribute :adjudication, list: Fhir::ExplanationOfBenefitClasses::Adjudication
      fhir_attribute :detail, list: Fhir::ExplanationOfBenefitClasses::ItemDetail
      fhir_attribute :prosthesis, type: Fhir::ExplanationOfBenefitClasses::ItemClasses::Prosthesis
    end
  end
end