module Fhir
  module ConformanceClasses
    class Resource < BaseClass
      fhir_attribute :type
      fhir_attribute :profile, type: Types::ResourceReference
      fhir_attribute :interaction, list: ConformanceClasses::Interaction
      fhir_attribute :versioning
      fhir_attribute :read_history
      fhir_attribute :update_create
      fhir_attribute :search_include, array: true
      fhir_attribute :search_param, list: ConformanceClasses::SearchParam
    end
  end
end
