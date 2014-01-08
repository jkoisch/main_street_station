module Fhir
  module ObservationClasses
    class ReferenceRange < BaseClass
      fhir_attribute :low
      fhir_attribute :high
      fhir_attribute :meaning, type: Fhir::Types::CodeableConcept
      fhir_attribute :age, type: Fhir::Types::Period
    end
  end
end