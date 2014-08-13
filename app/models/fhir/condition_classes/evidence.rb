module Fhir
  module ConditionClasses
    class Evidence < BaseClass
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :detail, list: Fhir::Types::ResourceReference
    end
  end
end