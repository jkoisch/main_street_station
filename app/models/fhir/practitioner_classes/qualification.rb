module Fhir
  module PractitionerClasses
    class Qualification < BaseClass
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :period, type: Fhir::Types::Period
      fhir_attribute :issuer, type: Fhir::Types::ResourceReference  #Organization
    end
  end
end