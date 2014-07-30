module Fhir
  module OrganizationClasses
    class Contact < BaseClass
      fhir_attribute :purpose, type: Fhir::Types::CodeableConcept
      fhir_attribute :name, type: Fhir::Types::HumanName
      fhir_attribute :telecom, list: Fhir::Types::Contact
      fhir_attribute :address, type: Fhir::Types::Address
      fhir_attribute :gender, type: Fhir::Types::CodeableConcept
    end
  end
end