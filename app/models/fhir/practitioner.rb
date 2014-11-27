module Fhir
  class Practitioner < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :name, type: Types::HumanName
    fhir_attribute :telecom, list: Types::Contact
    fhir_attribute :address, type: Types::Address
    fhir_attribute :gender, type: Types::CodeableConcept
    fhir_attribute :birth_date
    #photo: Attachment
    fhir_attribute :organization, list: Types::ResourceReference #Organization
    fhir_attribute :role, list: Types::CodeableConcept
    fhir_attribute :specialty, list: Types::CodeableConcept
    fhir_attribute :period, type: Types::Period
    fhir_attribute :location, list: Types::ResourceReference #Location
    fhir_attribute :qualification, list: PractitionerClasses::Qualification
    fhir_attribute :communication, list: Types::CodeableConcept
  end
end