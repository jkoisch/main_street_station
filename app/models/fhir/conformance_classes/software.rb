module Fhir
  module ConformanceClasses
    class Software < BaseClass
      fhir_attribute :name
      fhir_attribute :version
      fhir_attribute :release_date
    end
  end
end
