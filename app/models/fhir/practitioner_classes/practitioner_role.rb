module Fhir
  module PractitionerClasses
    class PractitionerRole < BaseClass
      fhir_attribute :managing_organization, type: Fhir::Types::ResourceReference
      fhir_attribute :role, type: Fhir::Types::CodeableConcept
      fhir_attribute :specialty, list: Fhir::Types::CodeableConcept
      fhir_attribute :period, type: Fhir::Types::Period
      fhir_attribute :location, list: Fhir::Types::ResourceReference
      fhir_attribute :healthcare_service, list: Fhir::Types::ResourceReference
    end
  end
end