module Fhir
  module ConformanceClasses
    class Rest < BaseClass
      fhir_attribute :mode
      fhir_attribute :documentation
      fhir_attribute :document_mailbox, array: true
      fhir_attribute :resource, list: ConformanceClasses::Resource
      fhir_attribute :operation, list: ConformanceClasses::Operation
      fhir_attribute :query, list: ConformanceClasses::Query
    end
  end
end