module Fhir
  module PatientClasses
    class Contact < BaseClass
      fhir_attribute :relationship, list: Fhir::Types::CodeableConcept
      fhir_attribute :name, type: Fhir::Types::HumanName
      fhir_attribute :telecom, list: Fhir::Types::Contact
      fhir_attribute :address, type: Fhir::Types::Address
      fhir_attribute :gender, type: Fhir::Types::CodeableConcept
      # TODO: Add reference to Organization
    end
  end
end
