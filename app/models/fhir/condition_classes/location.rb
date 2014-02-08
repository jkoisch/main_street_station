module Fhir
  module ConditionClasses
    class Location < BaseClass
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :detail
    end
  end
end