module Fhir
  module Types
    class Ratio < BaseType
      fhir_attribute :numerator, type: Quantity
      fhir_attribute :denominator, type: Quantity
    end
  end
end