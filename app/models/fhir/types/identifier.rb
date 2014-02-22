module Fhir
  module Types
    class Identifier < KeyedBaseType
      fhir_attribute :use
      fhir_attribute :label
      fhir_attribute :system
      fhir_attribute :value
      fhir_attribute :period, type: Period
      # TODO: Needs assigner attribute: Resource(Organization)
    end
  end
end
