module Fhir
  module Types
    class HumanName < BaseType
      fhir_attribute :use
      fhir_attribute :text
      fhir_attribute :family, array: true
      fhir_attribute :given, array: true
      fhir_attribute :prefix, array: true
      fhir_attribute :suffix, array: true
      fhir_attribute :period, type: Period
    end
  end
end