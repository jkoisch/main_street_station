module Fhir
  module ConformanceClasses
    class Interaction < BaseClass
      fhir_attribute :code
      fhir_attribute :documentation
    end
  end
end