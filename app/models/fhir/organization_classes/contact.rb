module Fhir
  module OrganizationClasses
    class Contact < BaseClass
      fhir_attribute :purpose, type: Fhir::Types::CodeableConcept
      fhir_attribute :name, type: Fhir::Types::HumanName
      fhir_attribute :telecom, list: Fhir::Types::ContactPoint
      fhir_attribute :address, type: Fhir::Types::Address
    end
  end
end