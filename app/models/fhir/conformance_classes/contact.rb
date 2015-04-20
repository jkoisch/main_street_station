module Fhir
  module ConformanceClasses
    class Contact < BaseClass
      fhir_attribute :name
      fhir_attribute :telecom, list: Fhir::Types::Contact
    end
  end
end