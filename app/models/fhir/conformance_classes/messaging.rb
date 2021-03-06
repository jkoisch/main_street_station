module Fhir
  module ConformanceClasses
    class Messaging < BaseClass
      fhir_attribute :endpoint, list: Fhir::ConformanceClasses::Endpoint
      fhir_attribute :reliable_cache
      fhir_attribute :documentation
      fhir_attribute :event, list: Fhir::ConformanceClasses::Event
    end
  end
end