module Fhir
  module ConformanceClasses
    class Query < BaseClass
      fhir_attribute :name
      fhir_attribute :documentation
      fhir_attribute :parameter, list: ConformanceClasses::SearchParam
    end
  end
end
