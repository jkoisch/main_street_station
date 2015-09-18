module Fhir
  module ConformanceClasses
    class Endpoint < BaseClass
      fhir_attribute :protocol, type: Types::Coding
      fhir_attribute :address
    end
  end
end