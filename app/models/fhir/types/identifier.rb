module Fhir
  module Types
    class Identifier < KeyedBaseType
      fhir_attribute :use
      fhir_attribute :type, type: CodeableConcept
      fhir_attribute :system
      fhir_attribute :value
      fhir_attribute :period, type: Period
      fhir_attribute :assigner, type: ResourceReference
    end
  end
end
