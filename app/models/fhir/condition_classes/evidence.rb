module Fhir
  module ConditionClasses
    class Evidence < BaseClass
      fhir_attribute :summary, type: Fhir::Types::CodeableConcept
    end
  end
end