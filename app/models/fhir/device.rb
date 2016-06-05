module Fhir
  class Device < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :udi_carrier, type: Types::Identifier
    fhir_attribute :status
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :lot_number
    fhir_attribute :manufacturer
    fhir_attribute :manufacture_date
    fhir_attribute :expiration_date
    fhir_attribute :model
    fhir_attribute :version
    fhir_attribute :patient, type: Types::Reference #Patient
    fhir_attribute :owner, type: Types::Reference #Organization
    fhir_attribute :contact, list: Types::ContactPoint
    fhir_attribute :location, type: Types::Reference #Location
    fhir_attribute :url
    fhir_attribute :note, list: Types::Annotation
  end
end