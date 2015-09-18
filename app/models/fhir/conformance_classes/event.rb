module Fhir
  module ConformanceClasses
    class Event < BaseClass
      fhir_attribute :code, type: Types::Coding
      fhir_attribute :category
      fhir_attribute :mode
      fhir_attribute :focus
      fhir_attribute :request, type: Types::Reference #Profile
      fhir_attribute :response, type: Types::Reference  #Profile
      fhir_attribute :documentation
    end
  end
end