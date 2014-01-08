module Fhir
  module Types
    class SampledData < BaseType
      fhir_attribute :origin
      fhir_attribute :period
      fhir_attribute :factor
      fhir_attribute :lower_limit
      fhir_attribute :upper_limit
      fhir_attribute :dimensions
      fhir_attribute :data
    end
  end
end