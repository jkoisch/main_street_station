module Fhir
  module ConformanceClasses
    class Certificate < BaseClass
      fhir_attribute :type
      fhir_attribute :blob
    end
  end
end