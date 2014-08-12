module Fhir
  module ConditionClasses
    class Stage < BaseClass
      fhir_attribute :summary, type: Fhir::Types::CodeableConcept
      fhir_attribute :assessment, list: Fhir::Types::ResourceReference
    end
  end
end