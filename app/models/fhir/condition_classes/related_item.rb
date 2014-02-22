module Fhir
  module ConditionClasses
    class RelatedItem < BaseClass
      fhir_attribute :type
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
    end
  end
end