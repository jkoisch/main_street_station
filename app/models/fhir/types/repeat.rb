module Fhir
  module Types
    class Repeat < BaseType
      fhir_attribute :frequency
      fhir_attribute :when
      fhir_attribute :duration
      fhir_attribute :units
      fhir_attribute :count
      fhir_attribute :end
    end
  end
end