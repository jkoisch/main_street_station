module Fhir
  module ConformanceClasses
    class Resource < BaseClass
      fhir_attribute :type
      # TODO: Need to add resource reference to Profile
      fhir_attribute :operation, list: ConformanceClasses::Operation
      fhir_attribute :read_history
      fhir_attribute :update_create
      fhir_attribute :search_include, array: true
      fhir_attribute :search_param, list: ConformanceClasses::SearchParam
    end
  end
end
