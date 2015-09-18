module Fhir
  module ConformanceClasses
    class Document < BaseClass
      fhir_attribute :mode
      fhir_attribute :documentation
      fhir_attribute :profile, type: Types::Reference
    end
  end
end