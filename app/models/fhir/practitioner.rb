module Fhir
  class Practitioner < BaseResource
    fhir_attribute :id
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :active
    fhir_attribute :name, type: Types::HumanName
    fhir_attribute :telecom, list: Types::ContactPoint
    fhir_attribute :address, list: Types::Address
    fhir_attribute :gender
    fhir_attribute :birth_date
    #photo:
    fhir_attribute :practitioner_role, list: PractitionerClasses::PractitionerRole
    fhir_attribute :qualification, list: PractitionerClasses::Qualification
    fhir_attribute :communication, list: Types::CodeableConcept
  end
end