module Fhir
  module OperationOutcomeClasses
    class Issue < BaseClass
      fhir_attribute :severity
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :details
      fhir_attribute :location, array: true
    end
  end
end