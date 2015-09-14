module Fhir
  module ConformanceClasses
    class Rest < BaseClass
      fhir_attribute :mode
      fhir_attribute :documentation
      fhir_attribute :security, type: ConformanceClasses::Security
      fhir_attribute :resource, list: ConformanceClasses::Resource
      fhir_attribute :interaction, list: ConformanceClasses::Interaction
      fhir_attribute :transaction_mode
      fhir_attribute :search_param, list: ConformanceClasses::SearchParam
      fhir_attribute :operation, list: ConformanceClasses::Operation
      fhir_attribute :compartment, array: true
    end
  end
end