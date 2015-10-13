module Fhir
  class Device < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :type, type: Types::CodeableConcept
    fhir_attribute :note, list: Types::Annotation
    fhir_attribute :status
    fhir_attribute :manufacturer
    fhir_attribute :model
    fhir_attribute :version
    fhir_attribute :manufacture_date
    fhir_attribute :expiry
    fhir_attribute :udi
    fhir_attribute :lot_number
    fhir_attribute :owner, type: Types::Reference #Organization
    fhir_attribute :location, type: Types::Reference #Location
    fhir_attribute :patient, type: Types::Reference #Patient
    fhir_attribute :contact, list: Types::ContactPoint
    fhir_attribute :url
  end
end