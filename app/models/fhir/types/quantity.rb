module Fhir
  module Types
    class Quantity < KeyedBaseType
      fhir_attribute :value
      fhir_attribute :comparator
      fhir_attribute :units
      fhir_attribute :system
      fhir_attribute :code
    end
  end
end
