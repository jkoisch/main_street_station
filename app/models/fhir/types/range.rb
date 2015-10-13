module Fhir
  module Types
    class Range < KeyedBaseType
      fhir_attribute :low, type: Quantity
      fhir_attribute :high, type: Quantity
    end
  end
end