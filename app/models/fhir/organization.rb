module Fhir
  class Organization < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :active
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :name
    fhir_attribute :telecom, list: Types::ContactPoint
    fhir_attribute :address, list: Types::Address
    fhir_attribute :part_of, type: Types::Reference
    fhir_attribute :contact, list: OrganizationClasses::Contact
  end
end