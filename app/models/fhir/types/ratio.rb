module Fhir
  module Types
    class Ratio < BaseType
      fhir_attribute :numerator
      fhir_attribute :denominator
    end
  end
end