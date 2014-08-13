module Fhir
  module ConditionClasses
    class RelatedItem < BaseClass
      fhir_attribute :type
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :target, type: Fhir::Types::ResourceReference
    end
  end
end