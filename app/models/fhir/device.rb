module Fhir
  class Device < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :manufacturer
    fhir_attribute :model
    fhir_attribute :version
    fhir_attribute :expiry
    fhir_attribute :udi
    fhir_attribute :lot_number
    # TODO: need a resource reference for owner: Resource(Organization)
    # TODO: need a resource reference for location: Resource(Location)
    # TODO: need a resource reference for patient: Resource(Patient)
    fhir_attribute :contact, list: Types::Contact
    fhir_attribute :url
  end
end