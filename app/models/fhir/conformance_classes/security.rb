module Fhir
  module ConformanceClasses
    class Security < BaseClass
      fhir_attribute :cors
      fhir_attribute :service, list: Fhir::Types::CodeableConcept
      fhir_attribute :description
      fhir_attribute :certificate, list: ConformanceClasses::Certificate
    end
  end
end