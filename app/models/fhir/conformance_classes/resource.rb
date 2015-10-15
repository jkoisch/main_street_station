module Fhir
  module ConformanceClasses
    class Resource < BaseClass
      fhir_attribute :type
      fhir_attribute :profile, type: Types::Reference
      fhir_attribute :interaction, list: ConformanceClasses::Interaction
      fhir_attribute :versioning
      fhir_attribute :read_history
      fhir_attribute :update_create
      fhir_attribute :conditional_create
      fhir_attribute :conditional_update
      fhir_attribute :conditional_delete
      fhir_attribute :search_include, array: true
      fhir_attribute :search_rev_include, array: true
      fhir_attribute :search_param, list: ConformanceClasses::SearchParam
    end
  end
end
