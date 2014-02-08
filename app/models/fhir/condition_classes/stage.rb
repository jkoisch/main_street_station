module Fhir
  module ConditionClasses
    class Stage < BaseClass
      fhir_attribute :summary, type: Fhir::Types::CodeableConcept
    end
  end
end