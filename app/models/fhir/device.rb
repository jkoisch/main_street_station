module Fhir
  class Device < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :manufacturer
    fhir_attribute :model
    fhir_attribute :version
    fhir_attribute :expiry
    fhir_attribute :udi
    fhir_attribute :lot_number
    # TODO: need a resource reference for owner
    # TODO: need a resource reference for location
    # TODO: need a resource reference for patient
    fhir_attribute :contact, list: Types::Contact
    fhir_attribute :url
  end
end