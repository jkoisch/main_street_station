module Fhir
  class Location < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :status
    fhir_attribute :name
    fhir_attribute :description
    fhir_attribute :mode
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :telecom, list: Types::ContactPoint
    fhir_attribute :address, type: Types::Address
    fhir_attribute :physical_type, type: Types::CodeableConcept
    fhir_attribute :position, type: Fhir::LocationClasses::Position
    fhir_attribute :managing_organization, type: Types::Reference #Organization
    fhir_attribute :part_of, type: Types::Reference #Location
  end
end