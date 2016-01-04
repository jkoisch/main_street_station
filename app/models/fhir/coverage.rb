module Fhir
  class Coverage < BaseResource
    fhir_attribute :issuer, type: Types::Reference #Organization
    fhir_attribute :bin, type: Types::Identifier
    fhir_attribute :period, type: Types::Period
    fhir_attribute :type, type: Types::Coding
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :group
    fhir_attribute :plan
    fhir_attribute :sub_plan
    fhir_attribute :dependent #, type: Types::SimpleInteger
    fhir_attribute :sequence  #, type: Types::SimpleInteger
    fhir_attribute :subscriber, type: Types::Reference #Patient
    fhir_attribute :network, type: Types::Identifier
    fhir_attribute :contract, list: Types::Reference #Contract
  end
end