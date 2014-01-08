module Fhir
  module Types
    class Range < BaseType
      fhir_attribute :low
      fhir_attribute :high
    end
  end
end