module Fhir
  module ExplanationOfBenefitClasses
    class ItemDetail < BaseClass
      fhir_attribute :sequence
      fhir_attribute :type, type: Types::Coding
      fhir_attribute :service, type: Types::Coding
      fhir_attribute :quantity, type: Types::Quantity
      fhir_attribute :unit_price, type: Types::Quantity
      fhir_attribute :factor
      fhir_attribute :points
      fhir_attribute :net, type: Types::Quantity
      fhir_attribute :udi, type: Types::Coding
      fhir_attribute :adjudication, list: Fhir::ExplanationOfBenefitClasses::Adjudication
      fhir_attribute :sub_detail, list: Fhir::ExplanationOfBenefitClasses::SubDetail
    end
  end
end