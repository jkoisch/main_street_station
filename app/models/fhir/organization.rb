module Fhir
  class Organization < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :name
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :telecom, list: Types::Contact
    fhir_attribute :address, list: Types::Address
    fhir_attribute :part_of, type: Types::ResourceReference
    fhir_attribute :contact, list: OrganizationClasses::Contact
    fhir_attribute :active
  end
end