module Fhir
  module ConformanceClasses
    class Operation < BaseClass
      fhir_attribute :code
      fhir_attribute :documentation
    end
  end
end
