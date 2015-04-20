module Fhir
  module PatientClasses
    class Communication < BaseClass
      fhir_attribute :language, list: Fhir::Types::CodeableConcept
      fhir_attribute :preferred
    end
  end
end