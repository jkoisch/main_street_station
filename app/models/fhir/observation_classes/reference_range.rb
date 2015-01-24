module Fhir
  module ObservationClasses
    class ReferenceRange < BaseClass
      fhir_attribute :low, type: Fhir::Types::Quantity
      fhir_attribute :high, type: Fhir::Types::Quantity
      fhir_attribute :meaning, type: Fhir::Types::CodeableConcept
      fhir_attribute :age, type: Fhir::Types::Range
      fhir_attribute :text
    end
  end
end