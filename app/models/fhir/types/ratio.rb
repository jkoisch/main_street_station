module Fhir
  module Types
    class Ratio < KeyedBaseType
      fhir_attribute :numerator, type: Quantity
      fhir_attribute :denominator, type: Quantity
    end
  end
end