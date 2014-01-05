module Fhir
  module ConformanceClasses
    class SearchParam < BaseClass
      fhir_attribute :name
      fhir_attribute :source
      fhir_attribute :type
      fhir_attribute :documentation
      fhir_attribute :xpath
      fhir_attribute :target, array: true
      fhir_attribute :chain, array: true
    end
  end
end
