module Fhir
  module ConformanceClasses
    class Operation < BaseClass
      fhir_attribute :name
      fhir_attribute :definition
    end
  end
end
