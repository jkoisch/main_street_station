module Fhir
  module Types
    class Address < KeyedBaseType
      fhir_attribute :use
      fhir_attribute :type
      fhir_attribute :text
      fhir_attribute :line, array: true
      fhir_attribute :city
      fhir_attribute :district
      fhir_attribute :state
      fhir_attribute :postal_code
      fhir_attribute :country
      fhir_attribute :period, type: Period
    end
  end
end
