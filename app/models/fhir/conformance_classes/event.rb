module Fhir
  module ConformanceClasses
    class Event < BaseClass
      fhir_attribute :code
      fhir_attribute :category
      fhir_attribute :mode
      fhir_attribute :protocol, list: Types::Coding
      fhir_attribute :focus
      fhir_attribute :request, type: Types::ResourceReference #Profile
      fhir_attribute :response, type: Types::ResourceReference  #Profile
      fhir_attribute :documentation
    end
  end
end