module Fhir
  module Types
    class Address < BaseType
      fhir_attribute :use
      fhir_attribute :text
      fhir_attribute :line, array: true
      fhir_attribute :city
      fhir_attribute :state
      fhir_attribute :zip
      fhir_attribute :country
      fhir_attribute :period, type: Period
    end
  end
end
